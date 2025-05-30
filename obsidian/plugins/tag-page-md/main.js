/*
THIS IS A GENERATED/BUNDLED FILE BY ESBUILD
if you want to view the source, please visit the github repository of this plugin
*/

var __defProp = Object.defineProperty;
var __getOwnPropDesc = Object.getOwnPropertyDescriptor;
var __getOwnPropNames = Object.getOwnPropertyNames;
var __hasOwnProp = Object.prototype.hasOwnProperty;
var __export = (target, all) => {
  for (var name in all)
    __defProp(target, name, { get: all[name], enumerable: true });
};
var __copyProps = (to, from, except, desc) => {
  if (from && typeof from === "object" || typeof from === "function") {
    for (let key of __getOwnPropNames(from))
      if (!__hasOwnProp.call(to, key) && key !== except)
        __defProp(to, key, { get: () => from[key], enumerable: !(desc = __getOwnPropDesc(from, key)) || desc.enumerable });
  }
  return to;
};
var __toCommonJS = (mod) => __copyProps(__defProp({}, "__esModule", { value: true }), mod);

// main.ts
var main_exports = {};
__export(main_exports, {
  default: () => TagPagePlugin
});
module.exports = __toCommonJS(main_exports);
var import_obsidian2 = require("obsidian");

// src/utils/obsidianApi.ts
var import_obsidian = require("obsidian");
var isTagPage = (app, tagPageFrontmatterKey, providedFile, tagOfInterest) => {
  var _a, _b, _c;
  const file = providedFile || ((_a = app.workspace.getActiveViewOfType(import_obsidian.MarkdownView)) == null ? void 0 : _a.file) || null;
  if (!file)
    return false;
  const frontmatterValue = (_c = (_b = app.metadataCache.getFileCache(file)) == null ? void 0 : _b.frontmatter) == null ? void 0 : _c[tagPageFrontmatterKey];
  if (tagOfInterest !== void 0) {
    return frontmatterValue === tagOfInterest;
  }
  return !!frontmatterValue;
};

// src/utils/tagSearch.ts
var getIsWildCard = (tag) => {
  const isWildCard = tag.endsWith("/*");
  const cleanedTag = isWildCard ? tag.slice(0, -2) : tag;
  return { isWildCard, cleanedTag };
};
var containsTag = (stringToSearch, tag) => {
  const { isWildCard, cleanedTag } = getIsWildCard(tag);
  const lowerStringToSearch = stringToSearch.toLowerCase();
  const lowerCleanedTag = cleanedTag.toLowerCase();
  if (isWildCard) {
    return lowerStringToSearch.includes(lowerCleanedTag);
  } else {
    const regex = new RegExp(`${lowerCleanedTag}\\s`, "gi");
    return regex.test(lowerStringToSearch);
  }
};
var findSmallestUnitsContainingTag = (content, tag, excludeBullets = false) => {
  const { isWildCard, cleanedTag } = getIsWildCard(tag);
  const escapedSubstring = cleanedTag.replace(/[.*+?^${}()|[\]\\]/g, "\\$&");
  const wildcardPattern = isWildCard ? "(?:\\/[^\\s]*)?" : "";
  const contentLines = content.split("\n").filter((line) => !(excludeBullets && line.trim().startsWith("-")));
  const matchesMap = /* @__PURE__ */ new Map();
  contentLines.forEach((line) => {
    const regex = new RegExp(`${escapedSubstring}${wildcardPattern}`, "gi");
    const matches = [...line.matchAll(regex)];
    matches.forEach((match) => {
      let key = match[0].toLowerCase();
      if (isWildCard && key.endsWith("/*")) {
        key = key.slice(0, -2);
      }
      if (!matchesMap.has(key)) {
        matchesMap.set(key, [line.trim()]);
      } else {
        const existingLines = matchesMap.get(key);
        if (!existingLines.includes(line.trim())) {
          existingLines.push(line.trim());
        }
      }
    });
  });
  return matchesMap;
};
var findBulletListsContainingTag = (content, tag) => {
  const capturedBulletLists = /* @__PURE__ */ new Map();
  const fileLines = content.split("\n").filter((line) => line.trim() !== "");
  let currentBulletIndentation = 0;
  const lastTagsAtCurrentIndentation = /* @__PURE__ */ new Set();
  let capturingSubBullet = false;
  fileLines.forEach((line) => {
    const lineTrim = line.trim();
    const startsWithBullet = lineTrim.startsWith("- ");
    const lineIndentation = line.search(/\S/);
    if (startsWithBullet) {
      const { isWildCard, cleanedTag } = getIsWildCard(tag);
      const tagRegex = isWildCard ? `${cleanedTag}(/[^\\s]+)?` : `${cleanedTag}(?![^\\s])`;
      const regex = new RegExp(tagRegex, "gi");
      const matches = line.match(regex);
      if (startsWithBullet && (matches || lineIndentation <= currentBulletIndentation)) {
        capturingSubBullet = false;
        currentBulletIndentation = lineIndentation;
        lastTagsAtCurrentIndentation.clear();
      }
      if (matches) {
        capturingSubBullet = false;
        matches.forEach((match) => {
          var _a;
          const trimmedMatch = isWildCard && match.endsWith("/") ? match.slice(0, -1) : match;
          const trimmedMatchLowerCase = trimmedMatch.toLowerCase();
          if (!capturedBulletLists.has(trimmedMatchLowerCase)) {
            capturedBulletLists.set(trimmedMatchLowerCase, []);
          }
          (_a = capturedBulletLists.get(trimmedMatchLowerCase)) == null ? void 0 : _a.push(
            lineIndentation > currentBulletIndentation && capturingSubBullet ? line : lineTrim
          );
          lastTagsAtCurrentIndentation.add(trimmedMatchLowerCase);
        });
      } else if (lineIndentation > currentBulletIndentation && lastTagsAtCurrentIndentation.size > 0) {
        capturingSubBullet = true;
        lastTagsAtCurrentIndentation.forEach((tag2) => {
          var _a;
          (_a = capturedBulletLists.get(tag2)) == null ? void 0 : _a.push(line);
        });
      }
    }
  });
  return capturedBulletLists;
};
function consolidateTagInfo(fileInfo, unitsContainingTag, bulletListsContainingTag) {
  const consolidatedInfo = /* @__PURE__ */ new Map();
  const addMatchesToConsolidatedInfo = (tag, matches) => {
    const existingMatches = consolidatedInfo.get(tag) || [];
    const newMatches = matches.map((matchString) => ({
      ...fileInfo,
      stringContainingTag: matchString
    }));
    consolidatedInfo.set(tag, existingMatches.concat(newMatches));
  };
  unitsContainingTag == null ? void 0 : unitsContainingTag.forEach((matches, tag) => {
    addMatchesToConsolidatedInfo(tag, matches);
  });
  bulletListsContainingTag == null ? void 0 : bulletListsContainingTag.forEach((matches, tag) => {
    addMatchesToConsolidatedInfo(tag, matches);
  });
  return consolidatedInfo;
}
var processFile = async (vault, settings, file, tagOfInterest) => {
  const fileContents = await vault.cachedRead(file);
  if (!containsTag(fileContents, tagOfInterest))
    return /* @__PURE__ */ new Map();
  const fileLink = settings.fullLinkName ? `[[${file.basename}]]` : `[[${file.basename}|*]]`;
  const fileInfo = {
    fileLink,
    timestamp: file.stat.ctime
  };
  switch (true) {
    case (settings.bulletedSubItems && settings.includeLines):
      return consolidateTagInfo(
        fileInfo,
        findSmallestUnitsContainingTag(
          fileContents,
          tagOfInterest,
          true
        ),
        findBulletListsContainingTag(fileContents, tagOfInterest)
      );
    case (settings.bulletedSubItems && !settings.includeLines):
      return consolidateTagInfo(
        fileInfo,
        void 0,
        findBulletListsContainingTag(fileContents, tagOfInterest)
      );
    case (!settings.bulletedSubItems && settings.includeLines):
    default:
      return consolidateTagInfo(
        fileInfo,
        findSmallestUnitsContainingTag(
          fileContents,
          tagOfInterest,
          false
        ),
        void 0
      );
  }
};
var fetchTagData = async (app, settings, tagOfInterest) => {
  const vault = app.vault;
  const allFiles = vault.getMarkdownFiles();
  return await Promise.all(
    allFiles.filter(
      (file) => !isTagPage(app, settings.frontmatterQueryProperty, file)
    ).map((file) => processFile(vault, settings, file, tagOfInterest))
  ).then((tagInfos) => {
    const consolidatedTagInfo = /* @__PURE__ */ new Map();
    tagInfos.forEach((tagInfo) => {
      tagInfo.forEach((details, tag) => {
        const existingDetails = consolidatedTagInfo.get(tag) || [];
        const combinedDetails = existingDetails.concat(details);
        if (settings.sortByDate === "desc" /* DESC */) {
          combinedDetails.sort((a, b) => b.timestamp - a.timestamp);
        } else {
          combinedDetails.sort((a, b) => a.timestamp - b.timestamp);
        }
        consolidatedTagInfo.set(tag, combinedDetails);
      });
    });
    return consolidatedTagInfo;
  });
};

// src/utils/pageContent.ts
var generateTagPageContent = async (app, settings, tagsInfo, tagOfInterest) => {
  const tagPageContent = [];
  tagPageContent.push(
    `---
${settings.frontmatterQueryProperty}: "${tagOfInterest}"
---`
  );
  tagPageContent.push(resolveTagPageTitle(settings, tagOfInterest));
  if (tagsInfo.size > 1) {
    const sortedTagsInfo = Array.from(tagsInfo).sort((a, b) => {
      return a[0].length - b[0].length;
    });
    sortedTagsInfo.forEach(([baseTag, details]) => {
      tagPageContent.push(`### ${baseTag}`);
      details.forEach(({ stringContainingTag, fileLink }) => {
        processTagMatch(stringContainingTag, fileLink, tagPageContent);
      });
    });
  } else {
    tagsInfo.forEach((details) => {
      details.forEach(({ stringContainingTag, fileLink }) => {
        processTagMatch(stringContainingTag, fileLink, tagPageContent);
      });
    });
  }
  const filesWithFrontmatterTag = app.vault.getMarkdownFiles().filter((file) => {
    var _a;
    const metaMatter = (_a = app.metadataCache.getFileCache(file)) == null ? void 0 : _a.frontmatter;
    return (metaMatter == null ? void 0 : metaMatter.tags) ? matchesTagOfInterest(metaMatter.tags, tagOfInterest) : false;
  }).map((file) => `- [[${file.basename}]]`);
  if (filesWithFrontmatterTag.length > 0) {
    const { cleanedTag } = getIsWildCard(tagOfInterest);
    tagPageContent.push(`## Files with ${cleanedTag} in frontmatter`);
    tagPageContent.push(...filesWithFrontmatterTag);
  }
  return tagPageContent.join("\n");
};
var extractFrontMatterTagValue = (app, view, frontMatterTag) => {
  var _a;
  if (view.file) {
    try {
      const metaMatter = (_a = app.metadataCache.getFileCache(view.file)) == null ? void 0 : _a.frontmatter;
      return metaMatter == null ? void 0 : metaMatter[frontMatterTag];
    } catch (err) {
      console.log(err);
      return;
    }
  }
};
function processTagMatch(fullTag, fileLink, tagPageContent) {
  if (fullTag.trim().startsWith("-")) {
    const [firstBullet, ...bullets] = fullTag.split("\n");
    const firstBulletWithLink = `${firstBullet} ${fileLink}`;
    tagPageContent.push([firstBulletWithLink, ...bullets].join("\n"));
  } else {
    tagPageContent.push(`- ${fullTag} ${fileLink}`);
  }
}
function matchesTagOfInterest(tags, tagOfInterest) {
  const normalizedTags = Array.isArray(tags) ? tags : [tags];
  const { isWildCard, cleanedTag: tagBase } = getIsWildCard(tagOfInterest);
  if (isWildCard) {
    return normalizedTags.some((tag) => {
      const fullTag = `#${tag}`;
      return fullTag === tagBase || fullTag.startsWith(`${tagBase}/`);
    });
  } else {
    return normalizedTags.some((tag) => `#${tag}` === tagBase);
  }
}
var swapPageContent = (activeLeaf, newPageContent) => {
  var _a;
  (_a = activeLeaf == null ? void 0 : activeLeaf.currentMode) == null ? void 0 : _a.set(newPageContent, true);
};
var generateFilename = (cleanedTag, isWildCard, nestedSeparator) => {
  return `${cleanedTag.replace("#", "").replaceAll("/", nestedSeparator)}${isWildCard ? nestedSeparator + "nested" : ""}${nestedSeparator}Tags.md`;
};
var resolveTagPageTitle = (settings, tagOfInterest) => {
  const template = settings.tagPageTitleTemplate;
  if (!template) {
    return `## Tag Content for ${tagOfInterest.replace("*", "")}`;
  } else {
    const tag = `${tagOfInterest.replace("*", "")}`;
    const tagName = `${tagOfInterest.replace("*", "")}`.replace("#", "");
    return "## " + template.replaceAll("{{lf}}", "\n").replaceAll("{{tag}}", " " + tag).replaceAll("{{tagname}}", tagName).replaceAll("  ", " ");
  }
};

// main.ts
var DEFAULT_SETTINGS = {
  tagPageDir: "Tags/",
  frontmatterQueryProperty: "tag-page-query",
  sortByDate: "desc" /* DESC */,
  nestedSeparator: "_",
  tagPageTitleTemplate: "Tag Content for {{tag}}",
  bulletedSubItems: true,
  includeLines: true,
  autoRefresh: true,
  fullLinkName: false
};
var TagPagePlugin = class extends import_obsidian2.Plugin {
  async onload() {
    await this.loadSettings();
    this.addSettingTab(new TagPageSettingTab(this.app, this));
    this.ribbonIcon = this.addRibbonIcon(
      "tag-glyph",
      "Refresh tag page",
      () => {
        this.refreshTagPageContent();
      }
    );
    this.ribbonIcon.style.display = "none";
    this.addCommand({
      id: "create-tag-page",
      name: "Create tag page",
      callback: () => {
        new CreateTagPageModal(this.app, this).open();
      }
    });
    this.registerEvent(
      this.app.workspace.on("layout-change", () => {
        this.updateRibbonIconVisibility();
        this.autoRefreshTagPage();
      })
    );
    this.registerEvent(
      this.app.workspace.on("file-open", () => {
        this.updateRibbonIconVisibility();
        this.autoRefreshTagPage();
      })
    );
    this.updateRibbonIconVisibility();
    await this.autoRefreshTagPage();
  }
  updateRibbonIconVisibility() {
    this.ribbonIcon.style.display = isTagPage(
      this.app,
      this.settings.frontmatterQueryProperty
    ) ? "block" : "none";
  }
  async autoRefreshTagPage() {
    if (this.settings.autoRefresh && isTagPage(this.app, this.settings.frontmatterQueryProperty)) {
      await this.refreshTagPageContent();
    }
  }
  onunload() {
  }
  async loadSettings() {
    this.settings = Object.assign(
      {},
      DEFAULT_SETTINGS,
      await this.loadData()
    );
  }
  async saveSettings() {
    await this.saveData(this.settings);
  }
  /**
   * Refreshes the content of the active tag page based on the current settings.
   *
   * @returns {Promise<void>} - A promise that resolves when the operation is complete.
   */
  async refreshTagPageContent() {
    const activeLeaf = this.app.workspace.getActiveViewOfType(import_obsidian2.MarkdownView);
    if (!activeLeaf)
      return;
    const tagOfInterest = extractFrontMatterTagValue(
      this.app,
      activeLeaf,
      this.settings.frontmatterQueryProperty
    );
    if (!tagOfInterest)
      return;
    const tagsInfo = await fetchTagData(
      this.app,
      this.settings,
      tagOfInterest
    );
    const tagPageContentString = await generateTagPageContent(
      this.app,
      this.settings,
      tagsInfo,
      tagOfInterest
    );
    swapPageContent(activeLeaf, tagPageContentString);
  }
  /**
   * Creates a new tag page or navigates to an existing one.
   *
   * @param {string} tag - The tag for which to create or navigate to a page.
   * @returns {Promise<void>} - A promise that resolves when the operation is complete.
   */
  async createTagPage(tag) {
    const tagOfInterest = tag.startsWith("#") ? tag : `#${tag}`;
    const { isWildCard, cleanedTag } = getIsWildCard(tagOfInterest);
    const filename = generateFilename(
      cleanedTag,
      isWildCard,
      this.settings.nestedSeparator
    );
    const tagPage = this.app.vault.getAbstractFileByPath(
      `${this.settings.tagPageDir}${filename}`
    );
    if (!tagPage) {
      const tagsInfo = await fetchTagData(
        this.app,
        this.settings,
        tagOfInterest
      );
      const tagPageContentString = await generateTagPageContent(
        this.app,
        this.settings,
        tagsInfo,
        tagOfInterest
      );
      const exists = await this.app.vault.adapter.exists(
        (0, import_obsidian2.normalizePath)(this.settings.tagPageDir)
      );
      if (!exists) {
        await this.app.vault.createFolder(this.settings.tagPageDir);
      }
      const createdPage = await this.app.vault.create(
        `${this.settings.tagPageDir}${filename}`,
        tagPageContentString
      );
      await this.app.workspace.getLeaf().openFile(createdPage);
    } else {
      await this.app.workspace.getLeaf().openFile(tagPage);
    }
  }
};
var CreateTagPageModal = class extends import_obsidian2.Modal {
  constructor(app, plugin) {
    super(app);
    this.plugin = plugin;
  }
  onOpen() {
    const { contentEl } = this;
    contentEl.setText("Tag to create page for:");
    const tagForm = contentEl.createEl("form");
    contentEl.addClass("create-page-modal");
    const input = tagForm.createEl("input", { type: "text" });
    input.placeholder = "#tag";
    input.value = "#";
    input.addEventListener("keydown", (e) => {
      const cursorPosition = input.selectionStart;
      if (cursorPosition === 1 && (e.key === "Backspace" || e.key === "Delete")) {
        e.preventDefault();
      }
    });
    const submitButton = tagForm.createEl("button", { type: "submit" });
    submitButton.innerText = "Create Tag Page";
    tagForm.addEventListener("submit", async (e) => {
      e.preventDefault();
      const tag = input.value;
      this.contentEl.empty();
      this.contentEl.setText(`Creating tag page for ${tag}...`);
      await this.plugin.createTagPage(tag);
      this.close();
    });
  }
  onClose() {
    const { contentEl } = this;
    contentEl.empty();
  }
};
var TagPageSettingTab = class extends import_obsidian2.PluginSettingTab {
  constructor(app, plugin) {
    super(app, plugin);
    this.plugin = plugin;
  }
  display() {
    const { containerEl } = this;
    containerEl.empty();
    new import_obsidian2.Setting(containerEl).setName("Tag page directory").setDesc("The directory in which to create tag pages.").addText(
      (text) => text.setValue(this.plugin.settings.tagPageDir).onChange(async (value) => {
        if (!value.endsWith("/")) {
          value = `${value}/`;
        }
        this.plugin.settings.tagPageDir = value;
        await this.plugin.saveSettings();
      })
    );
    new import_obsidian2.Setting(containerEl).setName("Frontmatter query property").setDesc(
      "The frontmatter property to use storing the query tag within the tag page. Required for page refresh."
    ).addText(
      (text) => text.setValue(this.plugin.settings.frontmatterQueryProperty).onChange(async (value) => {
        this.plugin.settings.frontmatterQueryProperty = value;
        await this.plugin.saveSettings();
      })
    );
    new import_obsidian2.Setting(containerEl).setName("Sort content by Date").setDesc(
      "Designate whether the content should be sorted in descending or ascending order. Defaults to descending (newest content first)."
    ).addDropdown(
      (component) => component.addOption("desc" /* DESC */, "Descending").addOption("asc" /* ASC */, "Ascending").setValue("desc" /* DESC */).onChange(async (value) => {
        this.plugin.settings.sortByDate = value;
        await this.plugin.saveSettings();
      })
    );
    new import_obsidian2.Setting(containerEl).setName("Nested page separator").setDesc(
      `Text used to separate levels for nested tags. Avoid \\/<>:"|?* and other characters that aren't file-safe, or you won't be able to make pages for nested tags.`
    ).addText(
      (text) => text.setValue(this.plugin.settings.nestedSeparator).onChange(async (value) => {
        this.plugin.settings.nestedSeparator = value;
        await this.plugin.saveSettings();
      })
    );
    new import_obsidian2.Setting(containerEl).setName("Tag page title template").setDesc(
      "Title template for the tag page. The placeholder '{{tag}}' will be replaced by the actual tag. The placeholder '{{tagname}}' will be replaced by just the tag name (without the '#' symbol and without a link). The placeholder '{{lf}}' (line feed) is used to add new lines for optional spacing or to insert static text between the title and the tags."
    ).addText(
      (text) => text.setValue(this.plugin.settings.tagPageTitleTemplate).onChange(async (value) => {
        this.plugin.settings.tagPageTitleTemplate = value;
        await this.plugin.saveSettings();
      })
    );
    new import_obsidian2.Setting(containerEl).setName("Include lines").setDesc("Include lines containing the tag in the tag page.").addToggle(
      (toggle) => toggle.setValue(this.plugin.settings.includeLines).onChange(async (value) => {
        this.plugin.settings.includeLines = value;
        await this.plugin.saveSettings();
      })
    );
    new import_obsidian2.Setting(containerEl).setName("Bulleted sub-items").setDesc(
      "Include bulleted sub-items containing the tag in the tag page."
    ).addToggle(
      (toggle) => toggle.setValue(this.plugin.settings.bulletedSubItems).onChange(async (value) => {
        this.plugin.settings.bulletedSubItems = value;
        await this.plugin.saveSettings();
      })
    );
    new import_obsidian2.Setting(containerEl).setName("Auto refresh").setDesc(
      "Automatically refresh tag pages when they are opened or become active."
    ).addToggle(
      (toggle) => toggle.setValue(this.plugin.settings.autoRefresh).onChange(async (value) => {
        this.plugin.settings.autoRefresh = value;
        await this.plugin.saveSettings();
      })
    );
    new import_obsidian2.Setting(containerEl).setName("Display full link name as reference").setDesc(
      "Each bit of pulled content will display the full link title as a reference as an end of line. Displays * when false."
    ).addToggle(
      (toggle) => toggle.setValue(this.plugin.settings.fullLinkName).onChange(async (value) => {
        this.plugin.settings.fullLinkName = value;
        await this.plugin.saveSettings();
      })
    );
  }
};

/* nosourcemap */