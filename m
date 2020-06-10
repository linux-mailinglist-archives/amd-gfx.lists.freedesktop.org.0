Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A0EEC1F5567
	for <lists+amd-gfx@lfdr.de>; Wed, 10 Jun 2020 15:10:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1968C6E10E;
	Wed, 10 Jun 2020 13:10:10 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43B926E517
 for <amd-gfx@lists.freedesktop.org>; Wed, 10 Jun 2020 09:52:28 +0000 (UTC)
IronPort-SDR: TFhvdY7+O7SLft2TJNy0KRa55ySnIW/SOwb9+iKTG44AaUj/euX9Ddmli9jFUxuqk66mhLAbPM
 IlzOGI8eqrLw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2020 02:52:21 -0700
IronPort-SDR: ZzvQkhgHvZvcqUrsFkdxNV042deSsHvS0fa9T3uHHvJaSIVqlnf2duh5G5SMtRJVqC7f+Ipxy2
 DRs7ZtW3wSyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,495,1583222400"; d="scan'208";a="380013092"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
 by fmsmga001.fm.intel.com with SMTP; 10 Jun 2020 02:52:18 -0700
Received: by lahna (sSMTP sendmail emulation); Wed, 10 Jun 2020 12:52:17 +0300
Date: Wed, 10 Jun 2020 12:52:17 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Paul Menzel <pmenzel@molgen.mpg.de>
Subject: Re: close() on some Intel CNP-LP PCI devices takes up to 2.7 s
Message-ID: <20200610095217.GE247495@lahna.fi.intel.com>
References: <b0781d0e-2894-100d-a4da-e56c225eb2a6@molgen.mpg.de>
 <20200609154416.GU247495@lahna.fi.intel.com>
 <3854150d-f193-d34e-557e-41090e4f39b5@molgen.mpg.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3854150d-f193-d34e-557e-41090e4f39b5@molgen.mpg.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Mailman-Approved-At: Wed, 10 Jun 2020 13:10:09 +0000
X-BeenThere: amd-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion list for AMD gfx <amd-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx@lists.freedesktop.org>
List-Help: <mailto:amd-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=subscribe>
Cc: Mario Limonciello <mario.limonciello@dell.com>, linux-pci@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, amd-gfx@lists.freedesktop.org,
 it+linux-pci@molgen.mpg.de, Bjorn Helgaas <bhelgaas@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gV2VkLCBKdW4gMTAsIDIwMjAgYXQgMDg6MTg6MDdBTSArMDIwMCwgUGF1bCBNZW56ZWwgd3Jv
dGU6Cj4gVGhhbmsgeW91IGZvciByZXBseWluZyBzbyBxdWlja2x5LiBIb3BlZnVsbHksIEnigJls
bCBiZSBhYmxlIHRvIHRlc3QgdGhlCj4gY29tbWl0IHRvbW9ycm93Lgo+IAo+IE9uZSBxdWVzdGlv
biB0aG91Z2guIFRoZSBjb21taXQgdGFsa3MgYWJvdXQgcmVzdW1pbmcgZnJvbSBzdXNwZW5kLiBJ
Cj4gdW5kZXJzdGFuZCB0aGF0IHRyYWluaW5nIGhhcHBlbnMgdGhlcmUuCj4gCj4gSW4gbXkgY2Fz
ZSB0aGUgc3lzdGVtIGlzIGFscmVhZHkgcnVubmluZy4gU28gSSB3b25kZXIsIHdoeSBsaW5rKD8p
IHRyYWluaW5nCj4gd291bGQgc3RpbGwgaGFwcGVuaW5nLgoKSXQgYWxzbyBpbmNsdWRlcyBydW50
aW1lIFBNIHNvIHdoZW4gdGhlIFBDSWUgdG9wb2xvZ3kgZ29lcyBpbnRvIEQzY29sZAp0aGUgbGlu
a3MgYXJlICJkb3duIiBzbyBvbmNlIHlvdSBydW4gdG9vbCBzdWNoIGFzIGxzcGNpIHRoZSBsaW5r
cyBuZWVkCnRvIGJlIHJlLXRyYWluZWQgdG8gYmUgYWJsZSB0byBhY2Nlc3MgdGhlIGRldmljZXMg
Y29ubmVjdGVkIHRvIHRoZW0uCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdm
eAo=
