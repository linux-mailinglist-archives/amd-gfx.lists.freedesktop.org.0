Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E512AAA01
	for <lists+amd-gfx@lfdr.de>; Thu,  5 Sep 2019 19:29:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAF436E05D;
	Thu,  5 Sep 2019 17:29:21 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D18B46E05D;
 Thu,  5 Sep 2019 17:29:19 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 05 Sep 2019 10:29:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,470,1559545200"; d="scan'208";a="195166809"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga002.jf.intel.com with SMTP; 05 Sep 2019 10:29:14 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 05 Sep 2019 20:29:14 +0300
Date: Thu, 5 Sep 2019 20:29:14 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: "Siqueira, Rodrigo" <Rodrigo.Siqueira@amd.com>
Subject: Re: [PATCH V4] drm: Add LTTPR defines for DP 1.4a
Message-ID: <20190905172914.GN7482@intel.com>
References: <20190904190116.klyt2rjg3svswmot@outlook.office365.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190904190116.klyt2rjg3svswmot@outlook.office365.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: "Li, Sun peng \(Leo\)" <Sunpeng.Li@amd.com>, "Berthe,
 Abdoulaye" <Abdoulaye.Berthe@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Manasi Navare <manasi.d.navare@intel.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 Daniel Vetter <daniel@ffwll.ch>, "Wentland, Harry" <Harry.Wentland@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gV2VkLCBTZXAgMDQsIDIwMTkgYXQgMDc6MDI6MThQTSArMDAwMCwgU2lxdWVpcmEsIFJvZHJp
Z28gd3JvdGU6Cj4gRFAgMS40YSBzcGVjaWZpY2F0aW9uIGRlZmluZXMgTGluayBUcmFpbmluZyBU
dW5hYmxlIFBIWSBSZXBlYXRlciAoTFRUUFIpCgpBIGJ1bmNoIG9mIHRoaXMgc3R1ZmYgd2FzIGFs
cmVhZHkgaW4gRFAgMS4zIHNvIHRoZSBzdGF0ZW1lbnQgaGVyZQooYW5kIGluIHRoZSBjb21tZW50
KSBpcyBhIGJpdCBtaXNsZWFkaW5nLgoKIkxUVFBSIiBpcyBub3QgYSBuYW1lIHRoYXQgYXBwZWFy
cyBhbnl3aGVyZSBpbiB0aGUgc3BlYyBBRkFJQ1MsIHNvCmNhbGxpbmcgaXQgdGhhdCBpcyBhIGJp
dCBjb25mdXNpbmcuCgo+IHdoaWNoIGlzIHJlcXVpcmVkIHRvIGFkZCBzdXBwb3J0IGZvciBzeXN0
ZW1zIHdpdGggVGh1bmRlcmJvbHQgb3Igb3RoZXIKPiByZXBlYXRlciBkZXZpY2VzLgoKInJlcXVp
cmVkIiBzZWVtcyBhIGJpdCBzdHJvbmcuIElJUkMgYnkgZGVmYXVsdCB0aGVzZSB0aGluZ3Mgc2hv
dWxkIGJlIGluCnRyYW5zcGFyZW50IG1vZGUgc28gdGhlIERQVFggY2FuIHJlbWFpbiBibGlzc2Z1
bGx5IHVuYXdhcmUgb2YgdGhlaXIKcHJlc2VuY2UuCgo+IAo+IENoYW5nZXMgc2luY2UgVjM6Cj4g
LSBSZXBsYWNlIHNwYWNlcyBieSB0YWJzCj4gQ2hhbmdlcyBzaW5jZSBWMjoKPiAtIERyb3AgdGhl
IGtlcm5lbC1kb2MgY29tbWVudAo+IC0gUmVvcmRlciBMVFRQUiBhY2NvcmRpbmcgdG8gcmVnaXN0
ZXIgb2Zmc2V0Cj4gQ2hhbmdlcyBzaW5jZSBWMToKPiAtIEFkanVzdHMgcmVnaXN0ZXJzIG5hbWVz
IHRvIGJlIGFsaWduZWQgd2l0aCBzcGVjIGFuZCB0aGUgcmVzdCBvZiB0aGUKPiAgIGZpbGUKPiAt
IFVwZGF0ZSBzcGVjIGNvbW1lbnQgZnJvbSAxLjQgdG8gMS40YQo+IAo+IENjOiBBYmRvdWxheWUg
QmVydGhlIDxBYmRvdWxheWUuQmVydGhlQGFtZC5jb20+Cj4gQ2M6IEhhcnJ5IFdlbnRsYW5kIDxo
YXJyeS53ZW50bGFuZEBhbWQuY29tPgo+IENjOiBMZW8gTGkgPHN1bnBlbmcubGlAYW1kLmNvbT4K
PiBDYzogSmFuaSBOaWt1bGEgPGphbmkubmlrdWxhQGxpbnV4LmludGVsLmNvbT4KPiBDYzogTWFu
YXNpIE5hdmFyZSA8bWFuYXNpLmQubmF2YXJlQGludGVsLmNvbT4KPiBDYzogVmlsbGUgU3lyasOk
bMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBSb2Ry
aWdvIFNpcXVlaXJhIDxSb2RyaWdvLlNpcXVlaXJhQGFtZC5jb20+Cj4gU2lnbmVkLW9mZi1ieTog
QWJkb3VsYXllIEJlcnRoZSA8QWJkb3VsYXllLkJlcnRoZUBhbWQuY29tPgo+IFJldmlld2VkLWJ5
OiBIYXJyeSBXZW50bGFuZCA8SGFycnkuV2VudGxhbmRAYW1kLmNvbT4KPiAtLS0KPiAgaW5jbHVk
ZS9kcm0vZHJtX2RwX2hlbHBlci5oIHwgMjUgKysrKysrKysrKysrKysrKysrKysrKysrKwo+ICAx
IGZpbGUgY2hhbmdlZCwgMjUgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9pbmNsdWRl
L2RybS9kcm1fZHBfaGVscGVyLmggYi9pbmNsdWRlL2RybS9kcm1fZHBfaGVscGVyLmgKPiBpbmRl
eCA4MzY0NTAyZjkyY2YuLjVhYmVkOTZhMWNiMSAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL2RybS9k
cm1fZHBfaGVscGVyLmgKPiArKysgYi9pbmNsdWRlL2RybS9kcm1fZHBfaGVscGVyLmgKPiBAQCAt
OTY2LDYgKzk2NiwzMSBAQAo+ICAjZGVmaW5lIERQX0hEQ1BfMl8yX1JFR19TVFJFQU1fVFlQRV9P
RkZTRVQJMHg2OTQ5NAo+ICAjZGVmaW5lIERQX0hEQ1BfMl8yX1JFR19EQkdfT0ZGU0VUCQkweDY5
NTE4Cj4gIAo+ICsvKiBMaW5rIFRyYWluaW5nIChMVCktdHVuYWJsZSBQaHlzaWNhbCBSZXBlYXRl
cnMgLSBEUCAxLjRhICovCgpzL1BoeXNpY2FsL1BIWS8gdG8gbWF0Y2ggdGhlIHNwZWMuCgo+ICsj
ZGVmaW5lIERQX0xUX1RVTkFCTEVfUEhZX1JFUEVBVEVSX0ZJRUxEX0RBVEFfU1RSVUNUVVJFX1JF
VgkweGYwMDAwCj4gKyNkZWZpbmUgRFBfTUFYX0xJTktfUkFURV9QSFlfUkVQRUFURVIJCQkJMHhm
MDAwMQo+ICsjZGVmaW5lIERQX1BIWV9SRVBFQVRFUl9DTlQJCQkJCTB4ZjAwMDIKPiArI2RlZmlu
ZSBEUF9QSFlfUkVQRUFURVJfTU9ERQkJCQkJMHhmMDAwMwo+ICsjZGVmaW5lIERQX01BWF9MQU5F
X0NPVU5UX1BIWV9SRVBFQVRFUgkJCQkweGYwMDA0Cj4gKyNkZWZpbmUgRFBfUEhZX1JFUEVBVEVS
X0VYVEVOREVEX1dBSVRfVElNRU9VVAkJCTB4ZjAwMDUKClRoZSBsYXN0IHR3byBhcmUgRFAgMS40
YSBpdCBzZWVtcy4KCjB4ZjAwMDQgd2FzIGNhbGxlZCBSZXBlYXRlcl9GRUNfQ0FQQUJJTElUWSBp
biAxLjQuIEJ1dCB0aGUgc3BlYyBkb2Vzbid0CnNheSBhbnl0aGluZyBhYm91dCB0aGUgRFBDRCBy
ZXZpc2lvbiBzbyBJIGhhdmUgbm8gaWRlYSBob3cgeW91J3JlCnN1cHBvc2VkIHRvIGRlY2lkZSB3
aGljaCBkZWZpbml0aW9uIHRvIHVzZS4KCkRQIDEuNGEgc2VlbXMgdG8gaGF2ZSBhZGRlZCBGRUNf
Q0FQQUJJTElUWV9QSFlfUkVQRUFURVIxIGF0IDB4ZjAyOTQuClRvIHJlcGxhY2UgdGhlIDEuNCBS
ZXBlYXRlcl9GRUNfQ0FQQUJJTElUWSBJIHN1cHBvc2UuCgo+ICsjZGVmaW5lIERQX1RSQUlOSU5H
X1BBVFRFUk5fU0VUX1BIWV9SRVBFQVRFUjEJCQkweGYwMDEwCj4gKyNkZWZpbmUgRFBfVFJBSU5J
TkdfTEFORTBfU0VUX1BIWV9SRVBFQVRFUjEJCQkweGYwMDExCj4gKyNkZWZpbmUgRFBfVFJBSU5J
TkdfTEFORTFfU0VUX1BIWV9SRVBFQVRFUjEJCQkweGYwMDEyCj4gKyNkZWZpbmUgRFBfVFJBSU5J
TkdfTEFORTJfU0VUX1BIWV9SRVBFQVRFUjEJCQkweGYwMDEzCj4gKyNkZWZpbmUgRFBfVFJBSU5J
TkdfTEFORTNfU0VUX1BIWV9SRVBFQVRFUjEJCQkweGYwMDE0Cj4gKyNkZWZpbmUgRFBfVFJBSU5J
TkdfQVVYX1JEX0lOVEVSVkFMX1BIWV9SRVBFQVRFUjEJCTB4ZjAwMjAKPiArI2RlZmluZSBEUF9U
UkFOU01JVFRFUl9DQVBBQklMSVRZX1BIWV9SRVBFQVRFUjEJCQkweGYwMDIxCgpBYm92ZSB0d28g
YXJlIERQIDEuNGEuCgo+ICsjZGVmaW5lIERQX0xBTkUwXzFfU1RBVFVTX1BIWV9SRVBFQVRFUjEJ
CQkJMHhmMDAzMAo+ICsjZGVmaW5lIERQX0xBTkUyXzNfU1RBVFVTX1BIWV9SRVBFQVRFUjEJCQkJ
MHhmMDAzMQo+ICsjZGVmaW5lIERQX0xBTkVfQUxJR05fU1RBVFVTX1VQREFURURfUEhZX1JFUEVB
VEVSMQkJMHhmMDAzMgo+ICsjZGVmaW5lIERQX0FESlVTVF9SRVFVRVNUX0xBTkUwXzFfUEhZX1JF
UEVBVEVSMQkJCTB4ZjAwMzMKPiArI2RlZmluZSBEUF9BREpVU1RfUkVRVUVTVF9MQU5FMl8zX1BI
WV9SRVBFQVRFUjEJCQkweGYwMDM0Cj4gKyNkZWZpbmUgRFBfU1lNQk9MX0VSUk9SX0NPVU5UX0xB
TkUwX1BIWV9SRVBFQVRFUjEJCTB4ZjAwMzUKPiArI2RlZmluZSBEUF9TWU1CT0xfRVJST1JfQ09V
TlRfTEFORTFfUEhZX1JFUEVBVEVSMQkJMHhmMDAzNwo+ICsjZGVmaW5lIERQX1NZTUJPTF9FUlJP
Ul9DT1VOVF9MQU5FMl9QSFlfUkVQRUFURVIxCQkweGYwMDM5Cj4gKyNkZWZpbmUgRFBfU1lNQk9M
X0VSUk9SX0NPVU5UX0xBTkUzX1BIWV9SRVBFQVRFUjEJCTB4ZjAwM2IKPiArI2RlZmluZSBEUF9G
RUNfU1RBVFVTX1BIWV9SRVBFQVRFUjEJCQkJMHhmMDI5MAoKVGhpcyBzZWVtcyB0byBoYXZlIGFw
cGFyZWQgaW4gRFAgMS40LgoKWW91IHNraXBwZWQgcXVpdGUgYSBmZXcgcmVnaXN0ZXJzIGhlcmUu
IEkgZ3Vlc3MgdGhvc2Ugd2VyZSBkZWVtZWQgbm90CmltcG9ydGFudD8KCj4gKwo+ICAvKiBEUCBI
RENQIG1lc3NhZ2Ugc3RhcnQgb2Zmc2V0cyBpbiBEUENEIGFkZHJlc3Mgc3BhY2UgKi8KPiAgI2Rl
ZmluZSBEUF9IRENQXzJfMl9BS0VfSU5JVF9PRkZTRVQJCURQX0hEQ1BfMl8yX1JFR19SVFhfT0ZG
U0VUCj4gICNkZWZpbmUgRFBfSERDUF8yXzJfQUtFX1NFTkRfQ0VSVF9PRkZTRVQJRFBfSERDUF8y
XzJfUkVHX0NFUlRfUlhfT0ZGU0VUCj4gLS0gCj4gMi4yMy4wCgoKCi0tIApWaWxsZSBTeXJqw6Rs
w6QKSW50ZWwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
