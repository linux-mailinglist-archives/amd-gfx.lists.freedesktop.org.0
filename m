Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B9A0114A33
	for <lists+amd-gfx@lfdr.de>; Fri,  6 Dec 2019 01:23:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F22216F93A;
	Fri,  6 Dec 2019 00:23:06 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 094836E16D;
 Fri,  6 Dec 2019 00:23:06 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 05 Dec 2019 16:23:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,282,1571727600"; d="scan'208";a="209291669"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
 by fmsmga008.fm.intel.com with ESMTP; 05 Dec 2019 16:23:04 -0800
Received: from kbuild by lkp-server01 with local (Exim 4.89)
 (envelope-from <lkp@intel.com>)
 id 1id1Oi-000F1r-3c; Fri, 06 Dec 2019 08:23:04 +0800
Date: Fri, 6 Dec 2019 08:22:04 +0800
From: kbuild test robot <lkp@intel.com>
To: mikita.lipski@amd.com
Subject: Re: [PATCH v8 01/17] drm/dp_mst: Add PBN calculation for DSC modes
Message-ID: <201912060739.ESIJ27eX%lkp@intel.com>
References: <20191203143530.27262-2-mikita.lipski@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191203143530.27262-2-mikita.lipski@amd.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-BeenThere: amd-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Discussion list for AMD gfx <amd-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx@lists.freedesktop.org>
List-Help: <mailto:amd-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=subscribe>
Cc: David Francis <David.Francis@amd.com>,
 Mikita Lipski <mikita.lipski@amd.com>, kbuild-all@lists.01.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

SGksCgpUaGFuayB5b3UgZm9yIHRoZSBwYXRjaCEgUGVyaGFwcyBzb21ldGhpbmcgdG8gaW1wcm92
ZToKClthdXRvIGJ1aWxkIHRlc3QgV0FSTklORyBvbiBuZXh0LTIwMTkxMjAzXQpbY2Fubm90IGFw
cGx5IHRvIGRybS1pbnRlbC9mb3ItbGludXgtbmV4dCBsaW51cy9tYXN0ZXIgdjUuNC1yYzggZHJt
LWV4eW5vcy9leHlub3MtZHJtLW5leHQgdjUuNF0KW2lmIHlvdXIgcGF0Y2ggaXMgYXBwbGllZCB0
byB0aGUgd3JvbmcgZ2l0IHRyZWUsIHBsZWFzZSBkcm9wIHVzIGEgbm90ZSB0byBoZWxwCmltcHJv
dmUgdGhlIHN5c3RlbS4gQlRXLCB3ZSBhbHNvIHN1Z2dlc3QgdG8gdXNlICctLWJhc2UnIG9wdGlv
biB0byBzcGVjaWZ5IHRoZQpiYXNlIHRyZWUgaW4gZ2l0IGZvcm1hdC1wYXRjaCwgcGxlYXNlIHNl
ZSBodHRwczovL3N0YWNrb3ZlcmZsb3cuY29tL2EvMzc0MDY5ODJdCgp1cmw6ICAgIGh0dHBzOi8v
Z2l0aHViLmNvbS8wZGF5LWNpL2xpbnV4L2NvbW1pdHMvbWlraXRhLWxpcHNraS1hbWQtY29tL0RT
Qy1NU1Qtc3VwcG9ydC1mb3ItRFJNLWFuZC1BTURHUFUvMjAxOTEyMDQtMDIwNjA0CmJhc2U6ICAg
IDFhYjc1YjJlNDE1YTI5ZGJhOWFlYzk0ZjIwM2M2Zjg4ZGJmYzBiYTAKcmVwcm9kdWNlOgogICAg
ICAgICMgYXB0LWdldCBpbnN0YWxsIHNwYXJzZQogICAgICAgICMgc3BhcnNlIHZlcnNpb246IHYw
LjYuMS05MS1nODE3MjcwZi1kaXJ0eQogICAgICAgIG1ha2UgQVJDSD14ODZfNjQgYWxsbW9kY29u
ZmlnCiAgICAgICAgbWFrZSBDPTEgQ0Y9Jy1mZGlhZ25vc3RpYy1wcmVmaXggLURfX0NIRUNLX0VO
RElBTl9fJwoKSWYgeW91IGZpeCB0aGUgaXNzdWUsIGtpbmRseSBhZGQgZm9sbG93aW5nIHRhZwpS
ZXBvcnRlZC1ieToga2J1aWxkIHRlc3Qgcm9ib3QgPGxrcEBpbnRlbC5jb20+CgoKc3BhcnNlIHdh
cm5pbmdzOiAobmV3IG9uZXMgcHJlZml4ZWQgYnkgPj4pCgo+PiBkcml2ZXJzL2dwdS9kcm0vc2Vs
ZnRlc3RzL3Rlc3QtZHJtX2RwX21zdF9oZWxwZXIuYzoyODo0Mzogc3BhcnNlOiBzcGFyc2U6IG5v
dCBlbm91Z2ggYXJndW1lbnRzIGZvciBmdW5jdGlvbiBkcm1fZHBfY2FsY19wYm5fbW9kZQoKdmlt
ICsyOCBkcml2ZXJzL2dwdS9kcm0vc2VsZnRlc3RzL3Rlc3QtZHJtX2RwX21zdF9oZWxwZXIuYwoK
N2NiY2U0NWQ2MjQzMjIgTHl1ZGUgUGF1bCAyMDE5LTA5LTAzICAxMyAgCjdjYmNlNDVkNjI0MzIy
IEx5dWRlIFBhdWwgMjAxOS0wOS0wMyAgMTQgIGludCBpZ3RfZHBfbXN0X2NhbGNfcGJuX21vZGUo
dm9pZCAqaWdub3JlZCkKN2NiY2U0NWQ2MjQzMjIgTHl1ZGUgUGF1bCAyMDE5LTA5LTAzICAxNSAg
ewo3Y2JjZTQ1ZDYyNDMyMiBMeXVkZSBQYXVsIDIwMTktMDktMDMgIDE2ICAJaW50IHBibiwgaTsK
N2NiY2U0NWQ2MjQzMjIgTHl1ZGUgUGF1bCAyMDE5LTA5LTAzICAxNyAgCWNvbnN0IHN0cnVjdCB7
CjdjYmNlNDVkNjI0MzIyIEx5dWRlIFBhdWwgMjAxOS0wOS0wMyAgMTggIAkJaW50IHJhdGU7Cjdj
YmNlNDVkNjI0MzIyIEx5dWRlIFBhdWwgMjAxOS0wOS0wMyAgMTkgIAkJaW50IGJwcDsKN2NiY2U0
NWQ2MjQzMjIgTHl1ZGUgUGF1bCAyMDE5LTA5LTAzICAyMCAgCQlpbnQgZXhwZWN0ZWQ7CjdjYmNl
NDVkNjI0MzIyIEx5dWRlIFBhdWwgMjAxOS0wOS0wMyAgMjEgIAl9IHRlc3RfcGFyYW1zW10gPSB7
CjdjYmNlNDVkNjI0MzIyIEx5dWRlIFBhdWwgMjAxOS0wOS0wMyAgMjIgIAkJeyAxNTQwMDAsIDMw
LCA2ODkgfSwKN2NiY2U0NWQ2MjQzMjIgTHl1ZGUgUGF1bCAyMDE5LTA5LTAzICAyMyAgCQl7IDIz
NDAwMCwgMzAsIDEwNDcgfSwKN2NiY2U0NWQ2MjQzMjIgTHl1ZGUgUGF1bCAyMDE5LTA5LTAzICAy
NCAgCQl7IDI5NzAwMCwgMjQsIDEwNjMgfSwKN2NiY2U0NWQ2MjQzMjIgTHl1ZGUgUGF1bCAyMDE5
LTA5LTAzICAyNSAgCX07CjdjYmNlNDVkNjI0MzIyIEx5dWRlIFBhdWwgMjAxOS0wOS0wMyAgMjYg
IAo3Y2JjZTQ1ZDYyNDMyMiBMeXVkZSBQYXVsIDIwMTktMDktMDMgIDI3ICAJZm9yIChpID0gMDsg
aSA8IEFSUkFZX1NJWkUodGVzdF9wYXJhbXMpOyBpKyspIHsKN2NiY2U0NWQ2MjQzMjIgTHl1ZGUg
UGF1bCAyMDE5LTA5LTAzIEAyOCAgCQlwYm4gPSBkcm1fZHBfY2FsY19wYm5fbW9kZSh0ZXN0X3Bh
cmFtc1tpXS5yYXRlLAo3Y2JjZTQ1ZDYyNDMyMiBMeXVkZSBQYXVsIDIwMTktMDktMDMgIDI5ICAJ
CQkJCSAgIHRlc3RfcGFyYW1zW2ldLmJwcCk7CjdjYmNlNDVkNjI0MzIyIEx5dWRlIFBhdWwgMjAx
OS0wOS0wMyAgMzAgIAkJRkFJTChwYm4gIT0gdGVzdF9wYXJhbXNbaV0uZXhwZWN0ZWQsCjdjYmNl
NDVkNjI0MzIyIEx5dWRlIFBhdWwgMjAxOS0wOS0wMyAgMzEgIAkJICAgICAiRXhwZWN0ZWQgUEJO
ICVkIGZvciBjbG9jayAlZCBicHAgJWQsIGdvdCAlZFxuIiwKN2NiY2U0NWQ2MjQzMjIgTHl1ZGUg
UGF1bCAyMDE5LTA5LTAzICAzMiAgCQkgICAgIHRlc3RfcGFyYW1zW2ldLmV4cGVjdGVkLCB0ZXN0
X3BhcmFtc1tpXS5yYXRlLAo3Y2JjZTQ1ZDYyNDMyMiBMeXVkZSBQYXVsIDIwMTktMDktMDMgIDMz
ICAJCSAgICAgdGVzdF9wYXJhbXNbaV0uYnBwLCBwYm4pOwo3Y2JjZTQ1ZDYyNDMyMiBMeXVkZSBQ
YXVsIDIwMTktMDktMDMgIDM0ICAJfQo3Y2JjZTQ1ZDYyNDMyMiBMeXVkZSBQYXVsIDIwMTktMDkt
MDMgIDM1ICAKN2NiY2U0NWQ2MjQzMjIgTHl1ZGUgUGF1bCAyMDE5LTA5LTAzICAzNiAgCXJldHVy
biAwOwo3Y2JjZTQ1ZDYyNDMyMiBMeXVkZSBQYXVsIDIwMTktMDktMDMgIDM3ICB9CjJmMDE1ZWM2
ZWFiNjkzIEx5dWRlIFBhdWwgMjAxOS0wOS0wMyAgMzggIAoKOjo6Ojo6IFRoZSBjb2RlIGF0IGxp
bmUgMjggd2FzIGZpcnN0IGludHJvZHVjZWQgYnkgY29tbWl0Cjo6Ojo6OiA3Y2JjZTQ1ZDYyNDMy
MjU5MTRiNWM5NjdiNGVlOTI3YTIzMjc4NDJhIGRybS9kcF9tc3Q6IE1vdmUgdGVzdF9jYWxjX3Bi
bl9tb2RlKCkgaW50byBhbiBhY3R1YWwgc2VsZnRlc3QKCjo6Ojo6OiBUTzogTHl1ZGUgUGF1bCA8
bHl1ZGVAcmVkaGF0LmNvbT4KOjo6Ojo6IENDOiBMeXVkZSBQYXVsIDxseXVkZUByZWRoYXQuY29t
PgoKLS0tCjAtREFZIGtlcm5lbCB0ZXN0IGluZnJhc3RydWN0dXJlICAgICAgICAgICAgICAgICBP
cGVuIFNvdXJjZSBUZWNobm9sb2d5IENlbnRlcgpodHRwczovL2xpc3RzLjAxLm9yZy9oeXBlcmtp
dHR5L2xpc3Qva2J1aWxkLWFsbEBsaXN0cy4wMS5vcmcgSW50ZWwgQ29ycG9yYXRpb24KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5n
IGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
