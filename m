Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0102675C0
	for <lists+amd-gfx@lfdr.de>; Fri, 12 Jul 2019 22:15:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8993888AE;
	Fri, 12 Jul 2019 20:15:30 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8648A888AE;
 Fri, 12 Jul 2019 20:15:29 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 12 Jul 2019 13:15:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,483,1557212400"; d="scan'208";a="157227753"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga007.jf.intel.com with SMTP; 12 Jul 2019 13:15:25 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 12 Jul 2019 23:15:25 +0300
Date: Fri, 12 Jul 2019 23:15:25 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Lyude Paul <lyude@redhat.com>
Subject: Re: [PATCH 07/10] drm/i915: Implement MST Aux device registration
Message-ID: <20190712201525.GO5942@intel.com>
References: <20190704190519.29525-1-sunpeng.li@amd.com>
 <20190704190519.29525-8-sunpeng.li@amd.com>
 <5673f815f4bc01b5d88961a1c087bed2e84ad466.camel@redhat.com>
 <20190712200559.GN5942@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190712200559.GN5942@intel.com>
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
Cc: sunpeng.li@amd.com, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Sean Paul <sean@poorly.run>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gRnJpLCBKdWwgMTIsIDIwMTkgYXQgMTE6MDU6NTlQTSArMDMwMCwgVmlsbGUgU3lyasOkbMOk
IHdyb3RlOgo+IE9uIEZyaSwgSnVsIDEyLCAyMDE5IGF0IDAzOjQ4OjUzUE0gLTA0MDAsIEx5dWRl
IFBhdWwgd3JvdGU6Cj4gPiBCVFcsIEkganVzdCB0cmllZCB0aGVzZSBwYXRjaGVzIG9uIG15IFQ0
NTBzICh1c2luZyBpOTE1KSBhbmQgSSdtIHNlZWluZyBzb21lCj4gPiBrZXJuZWwgd2FybmluZ3Mg
d2l0aCB0aGVtIHdoZW4gYWRkaW5nIERQIGF1eCBkZXZpY2VzIGFmdGVyIGNvbm5lY3RpbmcgYSBu
ZXcKPiA+IE1TVCB0b3BvbG9neSB0byB0aGUgc3lzdGVtOiAKPiA+IAo+ID4gWyAgMzY3Ljc0MjU3
MV0gV0FSTklORzogQ1BVOiAyIFBJRDogNDQyIGF0IGRyaXZlcnMvZ3B1L2RybS9kcm1fbW9kZV9v
YmplY3QuYzo0NSBfX2RybV9tb2RlX29iamVjdF9hZGQrMHhhYS8weGIwIFtkcm1dCj4gCj4gTG9v
a3MgbGlrZSBEYW5pZWwgYWRkZWQgdGhhdCBwYXJ0aWN1bGFyIFdBUk4gaW4KPiBjb21taXQgNGY1
MzY4YjU1NDFhICAoImRybS9rbXM6IENhdGNoIG1vZGVfb2JqZWN0IGxpZmV0aW1lIGVycm9ycyIp
LgoKQW5kIEknbSB0aGUgb25lIHdobyBhZGRlZCB0aGUgbWF4X2JwYyBwcm9wIHRvIHRoZSBtc3Qg
Y29ubmVjdG9ycywgd2hpY2gKaXMgYSBwZXItY29ubmVjdG9yIHByb3BlcnR5IChpZS4gYSBuZXcg
b25lIGdldHMgY3JlYXRlZCBmb3IgZXZlcnkKY29ubmVjb3RvcikuIFNvIHRoYXQgY291bGQgYmUg
YSBwcm9ibGVtIEkgc3VwcG9zZS4gSSBndWVzcyB3ZSBtYXkgbmVlZAp0byBjcmVhdGUganVzdCBv
bmUgb2YgdGhlc2UgZm9yIE1TVCBhbmQgcmV1c2UgaXQgZm9yIGV2ZXJ5IGNvbm5lY3Rvci4KQ291
bGQganVzdCBwb2ludCBhdCB0aGUgcHJvcCBvZiB0aGUgY29ycmVzcG9uZGluZyBTU1QgY29ubmVj
dG9yIEkKc3VwcG9zZS4uLgoKKyAgICAgICAvKiBSZXVzZSB0aGUgcHJvcCBiZWNhdXNlIGJsYWgg
Ki8KKyAgICAgICBjb25uZWN0b3ItPm1heF9icGNfcHJvcGVydHkgPQorICAgICAgICAgICAgICAg
aW50ZWxfZHAtPmF0dGFjaGVkX2Nvbm5lY3Rvci0+YmFzZS5tYXhfYnBjX3Byb3BlcnR5OwogICAg
ICAgIGRybV9jb25uZWN0b3JfYXR0YWNoX21heF9icGNfcHJvcGVydHkoY29ubmVjdG9yLCA2LCAx
Mik7CgoKLS0gClZpbGxlIFN5cmrDpGzDpApJbnRlbApfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2FtZC1nZng=
