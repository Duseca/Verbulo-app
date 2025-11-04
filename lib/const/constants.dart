import 'package:flutter/material.dart';
import 'package:verbulo/const/app_colors.dart';
import 'package:verbulo/const/app_fonts.dart';

TextStyle simpletxtStyle = TextStyle(
  fontWeight: FontWeight.normal,
  fontSize: 11,
  fontFamily: MANROPE,
  color: kGreyColor,
);
TextStyle boldtxtStyle = TextStyle(
  fontWeight: FontWeight.w600,
  fontSize: 12,
  fontFamily: MANROPE,
  color: kTertiaryColor,
);

final Map<String, List<Map<String, dynamic>>> wordData = {
  'A': [
    {
      'name': 'Amiable',
      'definition': 'Friendly, pleasant',
      'favorite': true,
      'tags': ['Adjective', '😊 Emotion'],
    },
    {
      'name': 'Ardent',
      'definition': 'Enthusiastic or passionate',
      'favorite': false,
      'tags': ['Adjective', '❤️ Emotion'],
    },
    {
      'name': 'Astute',
      'definition': 'Having sharp judgment',
      'favorite': true,
      'tags': ['Adjective', '🧠 Intelligence'],
    },
  ],
  'B': [
    {
      'name': 'Benevolent',
      'definition': 'Well-meaning, kind',
      'favorite': true,
      'tags': ['Adjective', '💼 Business'],
    },
    {
      'name': 'Boisterous',
      'definition': 'Noisy, energetic, cheerful',
      'favorite': false,
      'tags': ['Adjective', '🎉 Emotion'],
    },
  ],
  'C': [
    {
      'name': 'Catalyst',
      'definition': 'Something that sparks change',
      'favorite': false,
      'tags': ['Noun', '🔬 Science'],
    },
    {
      'name': 'Candid',
      'definition': 'Truthful and straightforward',
      'favorite': true,
      'tags': ['Adjective', '💬 Communication'],
    },
    {
      'name': 'Cordial',
      'definition': 'Warm and friendly',
      'favorite': false,
      'tags': ['Adjective', '😊 Emotion'],
    },
  ],
  'D': [
    {
      'name': 'Diligent',
      'definition': 'Careful and hardworking',
      'favorite': false,
      'tags': ['Adjective', '💼 Work'],
    },
    {
      'name': 'Dexterous',
      'definition': 'Skillful with hands',
      'favorite': true,
      'tags': ['Adjective', '✋ Skill'],
    },
  ],
  'E': [
    {
      'name': 'Eloquent',
      'definition': 'Fluent and persuasive in speaking',
      'favorite': false,
      'tags': ['Adjective', '💬 Communication'],
    },
    {
      'name': 'Ephemeral',
      'definition': 'Lasting for a very short time',
      'favorite': true,
      'tags': ['Adjective', '⏰ Time'],
    },
    {
      'name': 'Exuberant',
      'definition': 'Filled with energy and excitement',
      'favorite': false,
      'tags': ['Adjective', '🎉 Emotion'],
    },
  ],
  'F': [
    {
      'name': 'Fastidious',
      'definition': 'Very attentive to detail',
      'favorite': true,
      'tags': ['Adjective', '🔍 Detail'],
    },
    {
      'name': 'Fervent',
      'definition': 'Having intense feeling',
      'favorite': false,
      'tags': ['Adjective', '🔥 Emotion'],
    },
  ],
  'G': [
    {
      'name': 'Gregarious',
      'definition': 'Fond of company, sociable',
      'favorite': false,
      'tags': ['Adjective', '👥 Social'],
    },
    {
      'name': 'Genial',
      'definition': 'Friendly and cheerful',
      'favorite': true,
      'tags': ['Adjective', '😊 Emotion'],
    },
  ],
  'H': [
    {
      'name': 'Harmonious',
      'definition': 'Forming a pleasing whole',
      'favorite': false,
      'tags': ['Adjective', '🎵 Harmony'],
    },
    {
      'name': 'Hapless',
      'definition': 'Unfortunate, unlucky',
      'favorite': false,
      'tags': ['Adjective', '😔 Emotion'],
    },
  ],
  'I': [
    {
      'name': 'Inquisitive',
      'definition': 'Curious, eager to learn',
      'favorite': true,
      'tags': ['Adjective', '❓ Curiosity'],
    },
    {
      'name': 'Intrepid',
      'definition': 'Fearless, adventurous',
      'favorite': false,
      'tags': ['Adjective', '🦁 Courage'],
    },
  ],
  'J': [
    {
      'name': 'Jubilant',
      'definition': 'Feeling great happiness',
      'favorite': true,
      'tags': ['Adjective', '🎉 Emotion'],
    },
    {
      'name': 'Judicious',
      'definition': 'Having good judgment',
      'favorite': false,
      'tags': ['Adjective', '⚖️ Wisdom'],
    },
  ],
  'K': [
    {
      'name': 'Keen',
      'definition': 'Sharp, intense, enthusiastic',
      'favorite': false,
      'tags': ['Adjective', '🔪 Sharpness'],
    },
  ],
  'L': [
    {
      'name': 'Lucid',
      'definition': 'Clear and easy to understand',
      'favorite': true,
      'tags': ['Adjective', '💡 Clarity'],
    },
    {
      'name': 'Loquacious',
      'definition': 'Very talkative',
      'favorite': false,
      'tags': ['Adjective', '💬 Communication'],
    },
  ],
  'M': [
    {
      'name': 'Meticulous',
      'definition': 'Showing great attention to detail',
      'favorite': true,
      'tags': ['Adjective', '🔍 Detail'],
    },
    {
      'name': 'Mundane',
      'definition': 'Lacking interest, ordinary',
      'favorite': false,
      'tags': ['Adjective', '📋 Common'],
    },
  ],
  'N': [
    {
      'name': 'Nonchalant',
      'definition': 'Casually calm and relaxed',
      'favorite': false,
      'tags': ['Adjective', '😎 Attitude'],
    },
    {
      'name': 'Nostalgic',
      'definition': 'Longing for the past',
      'favorite': true,
      'tags': ['Adjective', '🕰️ Time'],
    },
  ],
  'O': [
    {
      'name': 'Opulent',
      'definition': 'Ostentatiously rich and luxurious',
      'favorite': false,
      'tags': ['Adjective', '💎 Wealth'],
    },
  ],
  'P': [
    {
      'name': 'Pragmatic',
      'definition': 'Dealing with things sensibly',
      'favorite': true,
      'tags': ['Adjective', '🎯 Practical'],
    },
    {
      'name': 'Pensive',
      'definition': 'Engaged in deep thought',
      'favorite': false,
      'tags': ['Adjective', '🤔 Thinking'],
    },
  ],
  'Q': [
    {
      'name': 'Quaint',
      'definition': 'Attractively unusual or old-fashioned',
      'favorite': false,
      'tags': ['Adjective', '🏚️ Charm'],
    },
  ],
  'R': [
    {
      'name': 'Resilient',
      'definition': 'Able to recover quickly',
      'favorite': true,
      'tags': ['Adjective', '💪 Strength'],
    },
    {
      'name': 'Reticent',
      'definition': 'Not revealing thoughts or feelings',
      'favorite': false,
      'tags': ['Adjective', '🤐 Reserved'],
    },
  ],
  'S': [
    {
      'name': 'Serene',
      'definition': 'Calm, peaceful, untroubled',
      'favorite': true,
      'tags': ['Adjective', '🧘 Peace'],
    },
    {
      'name': 'Sagacious',
      'definition': 'Having good judgment',
      'favorite': false,
      'tags': ['Adjective', '🦉 Wisdom'],
    },
  ],
  'T': [
    {
      'name': 'Tenacious',
      'definition': 'Not readily giving up',
      'favorite': true,
      'tags': ['Adjective', '🎯 Determination'],
    },
    {
      'name': 'Taciturn',
      'definition': 'Reserved in speech',
      'favorite': false,
      'tags': ['Adjective', '🤐 Quiet'],
    },
  ],
  'U': [
    {
      'name': 'Ubiquitous',
      'definition': 'Present everywhere',
      'favorite': false,
      'tags': ['Adjective', '🌍 Everywhere'],
    },
  ],
  'V': [
    {
      'name': 'Vivacious',
      'definition': 'Attractively lively',
      'favorite': true,
      'tags': ['Adjective', '✨ Energy'],
    },
    {
      'name': 'Vigilant',
      'definition': 'Keeping careful watch',
      'favorite': false,
      'tags': ['Adjective', '👁️ Watchful'],
    },
  ],
  'W': [
    {
      'name': 'Whimsical',
      'definition': 'Playfully quaint or fanciful',
      'favorite': false,
      'tags': ['Adjective', '🎨 Creative'],
    },
  ],
  'Z': [
    {
      'name': 'Zealous',
      'definition': 'Having great energy or enthusiasm',
      'favorite': true,
      'tags': ['Adjective', '🔥 Passion'],
    },
  ],
};
