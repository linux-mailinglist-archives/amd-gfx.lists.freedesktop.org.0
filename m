Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 206F4C06B3
	for <lists+amd-gfx@lfdr.de>; Fri, 27 Sep 2019 15:52:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B41E6E822;
	Fri, 27 Sep 2019 13:52:11 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-yw1-xc41.google.com (mail-yw1-xc41.google.com
 [IPv6:2607:f8b0:4864:20::c41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B43036E822
 for <amd-gfx@lists.freedesktop.org>; Fri, 27 Sep 2019 13:52:09 +0000 (UTC)
Received: by mail-yw1-xc41.google.com with SMTP id h73so924527ywa.1
 for <amd-gfx@lists.freedesktop.org>; Fri, 27 Sep 2019 06:52:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=h29ZLPtTrnlEGihpamSr90EBV0Vyvg/2iUfpSQon3sI=;
 b=ppj45Ji7Zu48QzRVqPDS/YU/ksXma6LCWLhWTSoyetGyXn/m5Du/0MESioaBqN45sL
 JpiZy/E9jcCcuSCibKXY02wc5apcF+/3XYp5HUqn8XNcwQpLoGtEywGErSyl/+W9oaGr
 vuGg9Sgn+QDoNH8HtdxQ3okC5C1Ep9OUsYIu8KLn0cqBu08M7eYDKza/GURDBmPH8lTb
 JCFN3dWNE6w2AOpizA2GDO/p70wWjFTSTOb1dxdeY5W8Ag2ukSO+Nhwpb1Y17UiFXTpB
 HuntI1lhFgMrNSOB3k6tlzza7uPlDvlQVLbW5c3hTruoP1lYxLPWDlBYwFNKwEvCAXGk
 UuPQ==
X-Gm-Message-State: APjAAAVhj2LMg+944lVrn+eOiV3EKkpHM2HJtnmfEbTUzcxD62gIjvF0
 snu0Vl7eUoamz0z2VSrL++0hGg==
X-Google-Smtp-Source: APXvYqzfFjIsSg818gzHNW4C6ZqtEgTgN0+2eZ6FE8PL5ycB0Cem1R5QEIS4r8eBIwwW/cYg/tAWCw==
X-Received: by 2002:a0d:e194:: with SMTP id k142mr2828821ywe.202.1569592328615; 
 Fri, 27 Sep 2019 06:52:08 -0700 (PDT)
Received: from localhost ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id r193sm607571ywg.38.2019.09.27.06.52.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Sep 2019 06:52:07 -0700 (PDT)
Date: Fri, 27 Sep 2019 09:52:07 -0400
From: Sean Paul <sean@poorly.run>
To: Lyude Paul <lyude@redhat.com>
Subject: Re: [PATCH v2 25/27] drm/dp_mst: Add basic topology reprobing when
 resuming
Message-ID: <20190927135207.GR218215@art_vandelay>
References: <20190903204645.25487-1-lyude@redhat.com>
 <20190903204645.25487-26-lyude@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190903204645.25487-26-lyude@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=h29ZLPtTrnlEGihpamSr90EBV0Vyvg/2iUfpSQon3sI=;
 b=KcPOWZUZe+bFeRJI7lemgWYm+puSDTm22eyj1t9oXuEtpJPUfe3fTqDqjsZdedVdM6
 0IOdpJ+T03Lp/7ic51zf64xeEg9bHQ30Xv2+/PydX6YYPJ9Mx6oHPluA3QGEK5T8clCB
 YumtaHxm/XJlEUvwQcWK6evBQtOwO1ubaeVSYhoDkJ2gZ7xhVDES8cxT2kSr2dupwrHs
 JLfgVoGVsftzof2I33PpwTpqyjUudH71rd8/BQ+WBZNtBxDvyFadFKveIpIMfFs2hS6Z
 4446DoHMdbDMa95IlT0rA2G0bF5jOuU4Cfp5Y89U1ngw4f+sRPAHA1qD5Ef/ZVwhG2Yt
 H87A==
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
Cc: David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 Imre Deak <imre.deak@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 dri-devel@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 Dhinakaran Pandiyan <dhinakaran.pandiyan@intel.com>,
 Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
 "David \(ChunMing\) Zhou" <David1.Zhou@amd.com>,
 Mario Kleiner <mario.kleiner.de@gmail.com>, Harry Wentland <hwentlan@amd.com>,
 David Francis <David.Francis@amd.com>, amd-gfx@lists.freedesktop.org,
 Ben Skeggs <bskeggs@redhat.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Harry Wentland <harry.wentland@amd.com>, Juston Li <juston.li@intel.com>,
 Leo Li <sunpeng.li@amd.com>, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?iso-8859-1?Q?Jos=E9?= Roberto de Souza <jose.souza@intel.com>,
 Sean Paul <sean@poorly.run>, Karol Herbst <karolherbst@gmail.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Manasi Navare <manasi.d.navare@intel.com>, Ilia Mirkin <imirkin@alum.mit.edu>,
 Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gVHVlLCBTZXAgMDMsIDIwMTkgYXQgMDQ6NDY6MDNQTSAtMDQwMCwgTHl1ZGUgUGF1bCB3cm90
ZToKPiBGaW5hbGx5ISBGb3IgYSB2ZXJ5IGxvbmcgdGltZSwgb3VyIE1TVCBoZWxwZXJzIGhhdmUg
aGFkIG9uZSB2ZXJ5Cj4gYW5ub3lpbmcgaXNzdWU6IFRoZXkgZG9uJ3Qga25vdyBob3cgdG8gcmVw
cm9iZSB0aGUgdG9wb2xvZ3kgc3RhdGUgd2hlbgo+IGNvbWluZyBvdXQgb2Ygc3VzcGVuZC4gVGhp
cyBtZWFucyB0aGF0IGlmIGEgdXNlciBoYXMgYSBtYWNoaW5lIGNvbm5lY3RlZAo+IHRvIGFuIE1T
VCB0b3BvbG9neSBhbmQgZGVjaWRlcyB0byBzdXNwZW5kIHRoZWlyIG1hY2hpbmUsIHdlIGxvc2Ug
YWxsCj4gdG9wb2xvZ3kgY2hhbmdlcyB0aGF0IGhhcHBlbmVkIGR1cmluZyB0aGF0IHBlcmlvZC4g
VGhhdCBjYW4gYmUgYSBiaWcKPiBwcm9ibGVtIGlmIHRoZSBtYWNoaW5lIHdhcyBjb25uZWN0ZWQg
dG8gYSBkaWZmZXJlbnQgdG9wb2xvZ3kgb24gdGhlIHNhbWUKPiBwb3J0IGJlZm9yZSByZXN1bWlu
ZywgYXMgd2Ugd29uJ3QgYm90aGVyIHJlcHJvYmluZyBhbnkgb2YgdGhlIHBvcnRzIGFuZAo+IGxp
a2VseSBjYXVzZSB0aGUgdXNlcidzIG1vbml0b3JzIG5vdCB0byBjb21lIGJhY2sgdXAgYXMgZXhw
ZWN0ZWQuCj4gCj4gU28sIHdlIHN0YXJ0IGZpeGluZyB0aGlzIGJ5IHRlYWNoaW5nIG91ciBNU1Qg
aGVscGVycyBob3cgdG8gcmVwcm9iZSB0aGUKPiBsaW5rIGFkZHJlc3NlcyBvZiBlYWNoIGNvbm5l
Y3RlZCB0b3BvbG9neSB3aGVuIHJlc3VtaW5nLiBBcyBpdCB0dXJucwo+IG91dCwgdGhlIGJlaGF2
aW9yIHRoYXQgd2Ugd2FudCBoZXJlIGlzIGlkZW50aWNhbCB0byB0aGUgYmVoYXZpb3Igd2Ugd2Fu
dAo+IHdoZW4gaW5pdGlhbGx5IHByb2JpbmcgYSBuZXdseSBjb25uZWN0ZWQgTVNUIHRvcG9sb2d5
LCB3aXRoIGEgY291cGxlIG9mCj4gaW1wb3J0YW50IGRpZmZlcmVuY2VzOgo+IAo+IC0gV2UgbmVl
ZCB0byBiZSBtb3JlIGNhcmVmdWwgYWJvdXQgaGFuZGxpbmcgdGhlIHBvdGVudGlhbCByYWNlcyBi
ZXR3ZWVuCj4gICBldmVudHMgZnJvbSB0aGUgTVNUIGh1YiB0aGF0IGNvdWxkIGNoYW5nZSB0aGUg
dG9wb2xvZ3kgc3RhdGUgYXMgd2UncmUKPiAgIHBlcmZvcm1pbmcgdGhlIGxpbmsgYWRkcmVzcyBy
ZXByb2JlCj4gLSBXZSBuZWVkIHRvIGJlIG1vcmUgY2FyZWZ1bCBhYm91dCBoYW5kbGluZyB1bmxp
a2VseSBzdGF0ZSBjaGFuZ2VzIG9uCj4gICBwb3J0cyAtIHN1Y2ggYXMgYW4gaW5wdXQgcG9ydCB0
dXJuaW5nIGludG8gYW4gb3V0cHV0IHBvcnQsIHNvbWV0aGluZwo+ICAgdGhhdCB3b3VsZCBiZSBm
YXIgbW9yZSBsaWtlbHkgdG8gaGFwcGVuIGluIHNpdHVhdGlvbnMgbGlrZSB0aGUgTVNUIGh1Ygo+
ICAgd2UncmUgY29ubmVjdGVkIHRvIGJlaW5nIGNoYW5nZWQgd2hpbGUgd2UncmUgc3VzcGVuZAo+
IAo+IEJvdGggb2Ygd2hpY2ggaGF2ZSBiZWVuIHNvbHZlZCBieSBwcmV2aW91cyBjb21taXRzLiBU
aGF0IGxlYXZlcyBvbmUKPiByZXF1aXJlbWVudDoKPiAKPiAtIFdlIG5lZWQgdG8gcHJ1bmUgYW55
IE1TVCBwb3J0cyBpbiBvdXIgaW4tbWVtb3J5IHRvcG9sb2d5IHN0YXRlIHRoYXQKPiAgIHdlcmUg
cHJlc2VudCB3aGVuIHN1c3BlbmRpbmcsIGJ1dCBoYXZlIG5vdCBhcHBlYXJlZCBpbiB0aGUgcG9z
dC1yZXN1bWUKPiAgIGxpbmsgYWRkcmVzcyByZXNwb25zZSBmcm9tIHRoZWlyIHBhcmVudCBicmFu
Y2ggZGV2aWNlCj4gCj4gV2hpY2ggd2UgY2FuIG5vdyBoYW5kbGUgaW4gdGhpcyBjb21taXQgYnkg
bW9kaWZ5aW5nCj4gZHJtX2RwX3NlbmRfbGlua19hZGRyZXNzKCkuIFdlIHRoZW4gaW50cm9kdWNl
IHN1c3BlbmQvcmVzdW1lIHJlcHJvYmluZwo+IGJ5IGludHJvZHVjaW5nIGRybV9kcF9tc3RfdG9w
b2xvZ3lfbWdyX2ludmFsaWRhdGVfbXN0YigpLCB3aGljaCB3ZSBjYWxsCj4gaW4gZHJtX2RwX21z
dF90b3BvbG9neV9tZ3Jfc3VzcGVuZCgpIHRvIHRyYXZlcnNlIHRoZSBpbi1tZW1vcnkgdG9wb2xv
Z3kKPiBzdGF0ZSB0byBpbmRpY2F0ZSB0aGF0IGVhY2ggbXN0YiBuZWVkcyBpdCdzIGxpbmsgYWRk
cmVzcyByZXNlbnQgYW5kIFBCTgo+IHJlc291cmNlcyByZXByb2JlZC4KPiAKPiBPbiByZXN1bWUs
IHdlIHN0YXJ0IGJhY2sgdXAgJm1nci0+d29yayBhbmQgaGF2ZSBpdCByZXByb2JlIHRoZSB0b3Bv
bG9neQo+IGluIHRoZSBzYW1lIHdheSB3ZSB3b3VsZCBvbiBhIGhvdHBsdWcsIHJlbW92aW5nIGFu
eSBsZWZ0b3ZlciBwb3J0cyB0aGF0Cj4gbm8gbG9uZ2VyIGFwcGVhciBpbiB0aGUgdG9wb2xvZ3kg
c3RhdGUuCj4gCj4gQ2M6IEp1c3RvbiBMaSA8anVzdG9uLmxpQGludGVsLmNvbT4KPiBDYzogSW1y
ZSBEZWFrIDxpbXJlLmRlYWtAaW50ZWwuY29tPgo+IENjOiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxl
LnN5cmphbGFAbGludXguaW50ZWwuY29tPgo+IENjOiBIYXJyeSBXZW50bGFuZCA8aHdlbnRsYW5A
YW1kLmNvbT4KPiBDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4KPiBT
aWduZWQtb2ZmLWJ5OiBMeXVkZSBQYXVsIDxseXVkZUByZWRoYXQuY29tPgo+IC0tLQo+ICAuLi4v
Z3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMgfCAgIDIgKy0KPiAgZHJp
dmVycy9ncHUvZHJtL2RybV9kcF9tc3RfdG9wb2xvZ3kuYyAgICAgICAgIHwgMTM4ICsrKysrKysr
KysrKystLS0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RwLmMgICAg
ICAgfCAgIDMgKy0KPiAgZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvZGlzcG52NTAvZGlzcC5jICAg
ICAgIHwgICA2ICstCj4gIGluY2x1ZGUvZHJtL2RybV9kcF9tc3RfaGVscGVyLmggICAgICAgICAg
ICAgICB8ICAgMyArLQo+ICA1IGZpbGVzIGNoYW5nZWQsIDExMiBpbnNlcnRpb25zKCspLCA0MCBk
ZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5
L2FtZGdwdV9kbS9hbWRncHVfZG0uYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRn
cHVfZG0vYW1kZ3B1X2RtLmMKPiBpbmRleCA0ZDNjOGJmZjc3ZGEuLjI3ZWUzZTA0NWI4NiAxMDA2
NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9k
bS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVf
ZG0uYwo+IEBAIC05NzMsNyArOTczLDcgQEAgc3RhdGljIHZvaWQgczNfaGFuZGxlX21zdChzdHJ1
Y3QgZHJtX2RldmljZSAqZGV2LCBib29sIHN1c3BlbmQpCj4gIAkJaWYgKHN1c3BlbmQpIHsKPiAg
CQkJZHJtX2RwX21zdF90b3BvbG9neV9tZ3Jfc3VzcGVuZChtZ3IpOwo+ICAJCX0gZWxzZSB7Cj4g
LQkJCXJldCA9IGRybV9kcF9tc3RfdG9wb2xvZ3lfbWdyX3Jlc3VtZShtZ3IpOwo+ICsJCQlyZXQg
PSBkcm1fZHBfbXN0X3RvcG9sb2d5X21ncl9yZXN1bWUobWdyLCB0cnVlKTsKPiAgCQkJaWYgKHJl
dCA8IDApIHsKPiAgCQkJCWRybV9kcF9tc3RfdG9wb2xvZ3lfbWdyX3NldF9tc3QobWdyLCBmYWxz
ZSk7Cj4gIAkJCQluZWVkX2hvdHBsdWcgPSB0cnVlOwo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9tc3Rf
dG9wb2xvZ3kuYwo+IGluZGV4IGU0MDdhYmExZmJkMi4uMmZlMjRlMzY2OTI1IDEwMDY0NAo+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMKPiArKysgYi9kcml2ZXJz
L2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5jCj4gQEAgLTIwMjAsNiArMjAyMCwxNCBAQCBk
cm1fZHBfbXN0X2hhbmRsZV9saW5rX2FkZHJlc3NfcG9ydChzdHJ1Y3QgZHJtX2RwX21zdF9icmFu
Y2ggKm1zdGIsCj4gIAkJZ290byBmYWlsX3VubG9jazsKPiAgCX0KPiAgCj4gKwkvKgo+ICsJICog
SWYgdGhpcyBwb3J0IHdhc24ndCBqdXN0IGNyZWF0ZWQsIHRoZW4gd2UncmUgcmVwcm9iaW5nIGJl
Y2F1c2UKPiArCSAqIHdlJ3JlIGNvbWluZyBvdXQgb2Ygc3VzcGVuZC4gSW4gdGhpcyBjYXNlLCBh
bHdheXMgcmVzZW5kIHRoZSBsaW5rCj4gKwkgKiBhZGRyZXNzIGlmIHRoZXJlJ3MgYW4gTVNUQiBv
biB0aGlzIHBvcnQKPiArCSAqLwo+ICsJaWYgKCFjcmVhdGVkICYmIHBvcnQtPnBkdCA9PSBEUF9Q
RUVSX0RFVklDRV9NU1RfQlJBTkNISU5HKQo+ICsJCXNlbmRfbGlua19hZGRyID0gdHJ1ZTsKPiAr
Cj4gIAlpZiAoc2VuZF9saW5rX2FkZHIpIHsKPiAgCQltdXRleF9sb2NrKCZtZ3ItPmxvY2spOwo+
ICAJCWlmIChwb3J0LT5tc3RiKSB7Cj4gQEAgLTI1MzAsNyArMjUzOCw4IEBAIHN0YXRpYyB2b2lk
IGRybV9kcF9zZW5kX2xpbmtfYWRkcmVzcyhzdHJ1Y3QgZHJtX2RwX21zdF90b3BvbG9neV9tZ3Ig
Km1nciwKPiAgewo+ICAJc3RydWN0IGRybV9kcF9zaWRlYmFuZF9tc2dfdHggKnR4bXNnOwo+ICAJ
c3RydWN0IGRybV9kcF9saW5rX2FkZHJlc3NfYWNrX3JlcGx5ICpyZXBseTsKPiAtCWludCBpLCBs
ZW4sIHJldDsKPiArCXN0cnVjdCBkcm1fZHBfbXN0X3BvcnQgKnBvcnQsICp0bXA7Cj4gKwlpbnQg
aSwgbGVuLCByZXQsIHBvcnRfbWFzayA9IDA7Cj4gIAo+ICAJdHhtc2cgPSBremFsbG9jKHNpemVv
ZigqdHhtc2cpLCBHRlBfS0VSTkVMKTsKPiAgCWlmICghdHhtc2cpCj4gQEAgLTI1NjAsOSArMjU2
OSwyOCBAQCBzdGF0aWMgdm9pZCBkcm1fZHBfc2VuZF9saW5rX2FkZHJlc3Moc3RydWN0IGRybV9k
cF9tc3RfdG9wb2xvZ3lfbWdyICptZ3IsCj4gIAo+ICAJZHJtX2RwX2NoZWNrX21zdGJfZ3VpZCht
c3RiLCByZXBseS0+Z3VpZCk7Cj4gIAo+IC0JZm9yIChpID0gMDsgaSA8IHJlcGx5LT5ucG9ydHM7
IGkrKykKPiArCWZvciAoaSA9IDA7IGkgPCByZXBseS0+bnBvcnRzOyBpKyspIHsKPiArCQlwb3J0
X21hc2sgfD0gQklUKHJlcGx5LT5wb3J0c1tpXS5wb3J0X251bWJlcik7Cj4gIAkJZHJtX2RwX21z
dF9oYW5kbGVfbGlua19hZGRyZXNzX3BvcnQobXN0YiwgbWdyLT5kZXYsCj4gIAkJCQkJCSAgICAm
cmVwbHktPnBvcnRzW2ldKTsKPiArCX0KPiArCj4gKwkvKiBQcnVuZSBhbnkgcG9ydHMgdGhhdCBh
cmUgY3VycmVudGx5IGEgcGFydCBvZiBtc3RiIGluIG91ciBpbi1tZW1vcnkKPiArCSAqIHRvcG9s
b2d5LCBidXQgd2VyZSBub3Qgc2VlbiBpbiB0aGlzIGxpbmsgYWRkcmVzcy4gVXN1YWxseSB0aGlz
Cj4gKwkgKiBtZWFucyB0aGF0IHRoZXkgd2VyZSByZW1vdmVkIHdoaWxlIHRoZSB0b3BvbG9neSB3
YXMgb3V0IG9mIHN5bmMsCj4gKwkgKiBlLmcuIGR1cmluZyBzdXNwZW5kL3Jlc3VtZQo+ICsJICov
Cj4gKwltdXRleF9sb2NrKCZtZ3ItPmxvY2spOwo+ICsJbGlzdF9mb3JfZWFjaF9lbnRyeV9zYWZl
KHBvcnQsIHRtcCwgJm1zdGItPnBvcnRzLCBuZXh0KSB7Cj4gKwkJaWYgKHBvcnRfbWFzayAmIEJJ
VChwb3J0LT5wb3J0X251bSkpCj4gKwkJCWNvbnRpbnVlOwo+ICsKPiArCQlEUk1fREVCVUdfS01T
KCJwb3J0ICVkIHdhcyBub3QgaW4gbGluayBhZGRyZXNzLCByZW1vdmluZ1xuIiwKPiArCQkJICAg
ICAgcG9ydC0+cG9ydF9udW0pOwo+ICsJCWxpc3RfZGVsKCZwb3J0LT5uZXh0KTsKPiArCQlkcm1f
ZHBfbXN0X3RvcG9sb2d5X3B1dF9wb3J0KHBvcnQpOwo+ICsJfQo+ICsJbXV0ZXhfdW5sb2NrKCZt
Z3ItPmxvY2spOwo+ICAKPiAgCWRybV9rbXNfaGVscGVyX2hvdHBsdWdfZXZlbnQobWdyLT5kZXYp
Owo+ICAKPiBAQCAtMzE5MSw2ICszMjE5LDIzIEBAIGludCBkcm1fZHBfbXN0X3RvcG9sb2d5X21n
cl9zZXRfbXN0KHN0cnVjdCBkcm1fZHBfbXN0X3RvcG9sb2d5X21nciAqbWdyLCBib29sIG1zCj4g
IH0KPiAgRVhQT1JUX1NZTUJPTChkcm1fZHBfbXN0X3RvcG9sb2d5X21ncl9zZXRfbXN0KTsKPiAg
Cj4gK3N0YXRpYyB2b2lkCj4gK2RybV9kcF9tc3RfdG9wb2xvZ3lfbWdyX2ludmFsaWRhdGVfbXN0
YihzdHJ1Y3QgZHJtX2RwX21zdF9icmFuY2ggKm1zdGIpCj4gK3sKPiArCXN0cnVjdCBkcm1fZHBf
bXN0X3BvcnQgKnBvcnQ7Cj4gKwo+ICsJLyogVGhlIGxpbmsgYWRkcmVzcyB3aWxsIG5lZWQgdG8g
YmUgcmUtc2VudCBvbiByZXN1bWUgKi8KPiArCW1zdGItPmxpbmtfYWRkcmVzc19zZW50ID0gZmFs
c2U7Cj4gKwo+ICsJbGlzdF9mb3JfZWFjaF9lbnRyeShwb3J0LCAmbXN0Yi0+cG9ydHMsIG5leHQp
IHsKPiArCQkvKiBUaGUgUEJOIGZvciBlYWNoIHBvcnQgd2lsbCBhbHNvIG5lZWQgdG8gYmUgcmUt
cHJvYmVkICovCj4gKwkJcG9ydC0+YXZhaWxhYmxlX3BibiA9IDA7Cj4gKwo+ICsJCWlmIChwb3J0
LT5tc3RiKQo+ICsJCQlkcm1fZHBfbXN0X3RvcG9sb2d5X21ncl9pbnZhbGlkYXRlX21zdGIocG9y
dC0+bXN0Yik7Cj4gKwl9Cj4gK30KPiArCj4gIC8qKgo+ICAgKiBkcm1fZHBfbXN0X3RvcG9sb2d5
X21ncl9zdXNwZW5kKCkgLSBzdXNwZW5kIHRoZSBNU1QgbWFuYWdlcgo+ICAgKiBAbWdyOiBtYW5h
Z2VyIHRvIHN1c3BlbmQKPiBAQCAtMzIwNyw2MCArMzI1Miw4NSBAQCB2b2lkIGRybV9kcF9tc3Rf
dG9wb2xvZ3lfbWdyX3N1c3BlbmQoc3RydWN0IGRybV9kcF9tc3RfdG9wb2xvZ3lfbWdyICptZ3Ip
Cj4gIAlmbHVzaF93b3JrKCZtZ3ItPnVwX3JlcV93b3JrKTsKPiAgCWZsdXNoX3dvcmsoJm1nci0+
d29yayk7Cj4gIAlmbHVzaF93b3JrKCZtZ3ItPmRlbGF5ZWRfZGVzdHJveV93b3JrKTsKPiArCj4g
KwltdXRleF9sb2NrKCZtZ3ItPmxvY2spOwo+ICsJaWYgKG1nci0+bXN0X3N0YXRlICYmIG1nci0+
bXN0X3ByaW1hcnkpCj4gKwkJZHJtX2RwX21zdF90b3BvbG9neV9tZ3JfaW52YWxpZGF0ZV9tc3Ri
KG1nci0+bXN0X3ByaW1hcnkpOwo+ICsJbXV0ZXhfdW5sb2NrKCZtZ3ItPmxvY2spOwo+ICB9Cj4g
IEVYUE9SVF9TWU1CT0woZHJtX2RwX21zdF90b3BvbG9neV9tZ3Jfc3VzcGVuZCk7Cj4gIAo+ICAv
KioKPiAgICogZHJtX2RwX21zdF90b3BvbG9neV9tZ3JfcmVzdW1lKCkgLSByZXN1bWUgdGhlIE1T
VCBtYW5hZ2VyCj4gICAqIEBtZ3I6IG1hbmFnZXIgdG8gcmVzdW1lCj4gKyAqIEBzeW5jOiB3aGV0
aGVyIG9yIG5vdCB0byBwZXJmb3JtIHRvcG9sb2d5IHJlcHJvYmluZyBzeW5jaHJvbm91c2x5Cj4g
ICAqCj4gICAqIFRoaXMgd2lsbCBmZXRjaCBEUENEIGFuZCBzZWUgaWYgdGhlIGRldmljZSBpcyBz
dGlsbCB0aGVyZSwKPiAgICogaWYgaXQgaXMsIGl0IHdpbGwgcmV3cml0ZSB0aGUgTVNUTSBjb250
cm9sIGJpdHMsIGFuZCByZXR1cm4uCj4gICAqCj4gLSAqIGlmIHRoZSBkZXZpY2UgZmFpbHMgdGhp
cyByZXR1cm5zIC0xLCBhbmQgdGhlIGRyaXZlciBzaG91bGQgZG8KPiArICogSWYgdGhlIGRldmlj
ZSBmYWlscyB0aGlzIHJldHVybnMgLTEsIGFuZCB0aGUgZHJpdmVyIHNob3VsZCBkbwo+ICAgKiBh
IGZ1bGwgTVNUIHJlcHJvYmUsIGluIGNhc2Ugd2Ugd2VyZSB1bmRvY2tlZC4KCm5pdDogSSBkb24n
dCB0aGluayB0aGlzIHNlbnRlbmNlIGFwcGxpZXMgYW55IGxvbmdlciBzaW5jZSB3ZSdyZSBkb2lu
ZyB0aGUgcmVwcm9iZS4KCj4gKyAqCj4gKyAqIER1cmluZyBzeXN0ZW0gcmVzdW1lICh3aGVyZSBp
dCBpcyBhc3N1bWVkIHRoYXQgdGhlIGRyaXZlciB3aWxsIGJlIGNhbGxpbmcKPiArICogZHJtX2F0
b21pY19oZWxwZXJfcmVzdW1lKCkpIHRoaXMgZnVuY3Rpb24gc2hvdWxkIGJlIGNhbGxlZCBiZWZv
cmVoYW5kIHdpdGgKPiArICogQHN5bmMgc2V0IHRvIHRydWUuIEluIGNvbnRleHRzIGxpa2UgcnVu
dGltZSByZXN1bWUgd2hlcmUgdGhlIGRyaXZlciBpcyBub3QKPiArICogZXhwZWN0ZWQgdG8gYmUg
Y2FsbGluZyBkcm1fYXRvbWljX2hlbHBlcl9yZXN1bWUoKSwgdGhpcyBmdW5jdGlvbiBzaG91bGQg
YmUKPiArICogY2FsbGVkIHdpdGggQHN5bmMgc2V0IHRvIGZhbHNlIGluIG9yZGVyIHRvIGF2b2lk
IGRlYWRsb2NraW5nLgo+ICsgKgo+ICsgKiBSZXR1cm5zOiAtMSBpZiB0aGUgTVNUIHRvcG9sb2d5
IHdhcyByZW1vdmVkIHdoaWxlIHdlIHdlcmUgc3VzcGVuZGVkLCAwCj4gKyAqIG90aGVyd2lzZS4K
PiAgICovCj4gLWludCBkcm1fZHBfbXN0X3RvcG9sb2d5X21ncl9yZXN1bWUoc3RydWN0IGRybV9k
cF9tc3RfdG9wb2xvZ3lfbWdyICptZ3IpCj4gK2ludCBkcm1fZHBfbXN0X3RvcG9sb2d5X21ncl9y
ZXN1bWUoc3RydWN0IGRybV9kcF9tc3RfdG9wb2xvZ3lfbWdyICptZ3IsCj4gKwkJCQkgICBib29s
IHN5bmMpCj4gIHsKPiAtCWludCByZXQgPSAwOwo+ICsJaW50IHJldDsKPiArCXU4IGd1aWRbMTZd
Owo+ICAKPiAgCW11dGV4X2xvY2soJm1nci0+bG9jayk7Cj4gKwlpZiAoIW1nci0+bXN0X3ByaW1h
cnkpCj4gKwkJZ290byBvdXRfZmFpbDsKPiAgCj4gLQlpZiAobWdyLT5tc3RfcHJpbWFyeSkgewo+
IC0JCWludCBzcmV0Owo+IC0JCXU4IGd1aWRbMTZdOwo+ICsJcmV0ID0gZHJtX2RwX2RwY2RfcmVh
ZChtZ3ItPmF1eCwgRFBfRFBDRF9SRVYsIG1nci0+ZHBjZCwKPiArCQkJICAgICAgIERQX1JFQ0VJ
VkVSX0NBUF9TSVpFKTsKPiArCWlmIChyZXQgIT0gRFBfUkVDRUlWRVJfQ0FQX1NJWkUpIHsKPiAr
CQlEUk1fREVCVUdfS01TKCJkcGNkIHJlYWQgZmFpbGVkIC0gdW5kb2NrZWQgZHVyaW5nIHN1c3Bl
bmQ/XG4iKTsKPiArCQlnb3RvIG91dF9mYWlsOwo+ICsJfQo+ICAKPiAtCQlzcmV0ID0gZHJtX2Rw
X2RwY2RfcmVhZChtZ3ItPmF1eCwgRFBfRFBDRF9SRVYsIG1nci0+ZHBjZCwgRFBfUkVDRUlWRVJf
Q0FQX1NJWkUpOwo+IC0JCWlmIChzcmV0ICE9IERQX1JFQ0VJVkVSX0NBUF9TSVpFKSB7Cj4gLQkJ
CURSTV9ERUJVR19LTVMoImRwY2QgcmVhZCBmYWlsZWQgLSB1bmRvY2tlZCBkdXJpbmcgc3VzcGVu
ZD9cbiIpOwo+IC0JCQlyZXQgPSAtMTsKPiAtCQkJZ290byBvdXRfdW5sb2NrOwo+IC0JCX0KPiAr
CXJldCA9IGRybV9kcF9kcGNkX3dyaXRlYihtZ3ItPmF1eCwgRFBfTVNUTV9DVFJMLAo+ICsJCQkJ
IERQX01TVF9FTiB8Cj4gKwkJCQkgRFBfVVBfUkVRX0VOIHwKPiArCQkJCSBEUF9VUFNUUkVBTV9J
U19TUkMpOwo+ICsJaWYgKHJldCA8IDApIHsKPiArCQlEUk1fREVCVUdfS01TKCJtc3Qgd3JpdGUg
ZmFpbGVkIC0gdW5kb2NrZWQgZHVyaW5nIHN1c3BlbmQ/XG4iKTsKPiArCQlnb3RvIG91dF9mYWls
Owo+ICsJfQo+ICAKPiAtCQlyZXQgPSBkcm1fZHBfZHBjZF93cml0ZWIobWdyLT5hdXgsIERQX01T
VE1fQ1RSTCwKPiAtCQkJCQkgRFBfTVNUX0VOIHwgRFBfVVBfUkVRX0VOIHwgRFBfVVBTVFJFQU1f
SVNfU1JDKTsKPiAtCQlpZiAocmV0IDwgMCkgewo+IC0JCQlEUk1fREVCVUdfS01TKCJtc3Qgd3Jp
dGUgZmFpbGVkIC0gdW5kb2NrZWQgZHVyaW5nIHN1c3BlbmQ/XG4iKTsKPiAtCQkJcmV0ID0gLTE7
Cj4gLQkJCWdvdG8gb3V0X3VubG9jazsKPiAtCQl9Cj4gKwkvKiBTb21lIGh1YnMgZm9yZ2V0IHRo
ZWlyIGd1aWRzIGFmdGVyIHRoZXkgcmVzdW1lICovCj4gKwlyZXQgPSBkcm1fZHBfZHBjZF9yZWFk
KG1nci0+YXV4LCBEUF9HVUlELCBndWlkLCAxNik7Cj4gKwlpZiAocmV0ICE9IDE2KSB7Cj4gKwkJ
RFJNX0RFQlVHX0tNUygiZHBjZCByZWFkIGZhaWxlZCAtIHVuZG9ja2VkIGR1cmluZyBzdXNwZW5k
P1xuIik7Cj4gKwkJZ290byBvdXRfZmFpbDsKPiArCX0KPiArCWRybV9kcF9jaGVja19tc3RiX2d1
aWQobWdyLT5tc3RfcHJpbWFyeSwgZ3VpZCk7Cj4gIAo+IC0JCS8qIFNvbWUgaHVicyBmb3JnZXQg
dGhlaXIgZ3VpZHMgYWZ0ZXIgdGhleSByZXN1bWUgKi8KPiAtCQlzcmV0ID0gZHJtX2RwX2RwY2Rf
cmVhZChtZ3ItPmF1eCwgRFBfR1VJRCwgZ3VpZCwgMTYpOwo+IC0JCWlmIChzcmV0ICE9IDE2KSB7
Cj4gLQkJCURSTV9ERUJVR19LTVMoImRwY2QgcmVhZCBmYWlsZWQgLSB1bmRvY2tlZCBkdXJpbmcg
c3VzcGVuZD9cbiIpOwo+IC0JCQlyZXQgPSAtMTsKPiAtCQkJZ290byBvdXRfdW5sb2NrOwo+IC0J
CX0KPiAtCQlkcm1fZHBfY2hlY2tfbXN0Yl9ndWlkKG1nci0+bXN0X3ByaW1hcnksIGd1aWQpOwo+
ICsJLyogRm9yIHRoZSBmaW5hbCBzdGVwIG9mIHJlc3VtaW5nIHRoZSB0b3BvbG9neSwgd2UgbmVl
ZCB0byBicmluZyB0aGUKPiArCSAqIHN0YXRlIG9mIG91ciBpbi1tZW1vcnkgdG9wb2xvZ3kgYmFj
ayBpbnRvIHN5bmMgd2l0aCByZWFsaXR5LiBTbywKPiArCSAqIHJlc3RhcnQgdGhlIHByb2Jpbmcg
cHJvY2VzcyBhcyBpZiB3ZSdyZSBwcm9iaW5nIGEgbmV3IGh1Ygo+ICsJICovCj4gKwlxdWV1ZV93
b3JrKHN5c3RlbV9sb25nX3dxLCAmbWdyLT53b3JrKTsKPiArCW11dGV4X3VubG9jaygmbWdyLT5s
b2NrKTsKPiAgCj4gLQkJcmV0ID0gMDsKPiAtCX0gZWxzZQo+IC0JCXJldCA9IC0xOwo+ICsJaWYg
KHN5bmMpIHsKPiArCQlEUk1fREVCVUdfS01TKCJXYWl0aW5nIGZvciBsaW5rIHByb2JlIHdvcmsg
dG8gZmluaXNoIHJlLXN5bmNpbmcgdG9wb2xvZ3kuLi5cbiIpOwo+ICsJCWZsdXNoX3dvcmsoJm1n
ci0+d29yayk7Cj4gKwl9CgpJdCB0b29rIG1lIGxvbmdlciB0aGFuIEknZCBsaWtlIHRvIGFkbWl0
IHRvIHJlYWxpemUgdGhhdCBtb3N0IG9mIHRoZSBkaWZmIGluCnRoaXMgZnVuY3Rpb24gaXMganVz
dCByZW1vdmluZyB0aGUgaW5kZW50LiBXb3VsZCB5b3UgbWluZCBzcGxpdHRpbmcgdGhhdCBvdXQK
aW50byBhIHNlcGFyYXRlIHBhdGNoIHNvIHRoZSByZXByb2JlIGNoYW5nZSBpcyBtb3JlIG9idmlv
dXM/CgpXaXRoIHRoZXNlIG5pdHMgZml4ZWQsCgpSZXZpZXdlZC1ieTogU2VhbiBQYXVsIDxzZWFu
QHBvb3JseS5ydW4+CgoKPiAgCj4gLW91dF91bmxvY2s6Cj4gKwlyZXR1cm4gMDsKPiArCj4gK291
dF9mYWlsOgo+ICAJbXV0ZXhfdW5sb2NrKCZtZ3ItPmxvY2spOwo+IC0JcmV0dXJuIHJldDsKPiAr
CXJldHVybiAtMTsKPiAgfQo+ICBFWFBPUlRfU1lNQk9MKGRybV9kcF9tc3RfdG9wb2xvZ3lfbWdy
X3Jlc3VtZSk7Cj4gIAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5
L2ludGVsX2RwLmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RwLmMKPiBp
bmRleCA1NjczZWQ3NWU0MjguLmI3ODM2NGRjZGVmOSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RwLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkx
NS9kaXNwbGF5L2ludGVsX2RwLmMKPiBAQCAtNzQwMCw3ICs3NDAwLDggQEAgdm9pZCBpbnRlbF9k
cF9tc3RfcmVzdW1lKHN0cnVjdCBkcm1faTkxNV9wcml2YXRlICpkZXZfcHJpdikKPiAgCQlpZiAo
IWludGVsX2RwLT5jYW5fbXN0KQo+ICAJCQljb250aW51ZTsKPiAgCj4gLQkJcmV0ID0gZHJtX2Rw
X21zdF90b3BvbG9neV9tZ3JfcmVzdW1lKCZpbnRlbF9kcC0+bXN0X21ncik7Cj4gKwkJcmV0ID0g
ZHJtX2RwX21zdF90b3BvbG9neV9tZ3JfcmVzdW1lKCZpbnRlbF9kcC0+bXN0X21nciwKPiArCQkJ
CQkJICAgICB0cnVlKTsKPiAgCQlpZiAocmV0KSB7Cj4gIAkJCWludGVsX2RwLT5pc19tc3QgPSBm
YWxzZTsKPiAgCQkJZHJtX2RwX21zdF90b3BvbG9neV9tZ3Jfc2V0X21zdCgmaW50ZWxfZHAtPm1z
dF9tZ3IsCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L2Rpc3BudjUwL2Rp
c3AuYyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L2Rpc3BudjUwL2Rpc3AuYwo+IGluZGV4IDMw
NzU4NDEwN2Q3Ny4uZTQ1OWUyYTc5ZDc4IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9u
b3V2ZWF1L2Rpc3BudjUwL2Rpc3AuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L2Rp
c3BudjUwL2Rpc3AuYwo+IEBAIC0xMzA5LDE0ICsxMzA5LDE0IEBAIG52NTBfbXN0bV9maW5pKHN0
cnVjdCBudjUwX21zdG0gKm1zdG0pCj4gIH0KPiAgCj4gIHN0YXRpYyB2b2lkCj4gLW52NTBfbXN0
bV9pbml0KHN0cnVjdCBudjUwX21zdG0gKm1zdG0pCj4gK252NTBfbXN0bV9pbml0KHN0cnVjdCBu
djUwX21zdG0gKm1zdG0sIGJvb2wgcnVudGltZSkKPiAgewo+ICAJaW50IHJldDsKPiAgCj4gIAlp
ZiAoIW1zdG0gfHwgIW1zdG0tPm1nci5tc3Rfc3RhdGUpCj4gIAkJcmV0dXJuOwo+ICAKPiAtCXJl
dCA9IGRybV9kcF9tc3RfdG9wb2xvZ3lfbWdyX3Jlc3VtZSgmbXN0bS0+bWdyKTsKPiArCXJldCA9
IGRybV9kcF9tc3RfdG9wb2xvZ3lfbWdyX3Jlc3VtZSgmbXN0bS0+bWdyLCAhcnVudGltZSk7Cj4g
IAlpZiAocmV0ID09IC0xKSB7Cj4gIAkJZHJtX2RwX21zdF90b3BvbG9neV9tZ3Jfc2V0X21zdCgm
bXN0bS0+bWdyLCBmYWxzZSk7Cj4gIAkJZHJtX2ttc19oZWxwZXJfaG90cGx1Z19ldmVudChtc3Rt
LT5tZ3IuZGV2KTsKPiBAQCAtMjI2Miw3ICsyMjYyLDcgQEAgbnY1MF9kaXNwbGF5X2luaXQoc3Ry
dWN0IGRybV9kZXZpY2UgKmRldiwgYm9vbCByZXN1bWUsIGJvb2wgcnVudGltZSkKPiAgCQlpZiAo
ZW5jb2Rlci0+ZW5jb2Rlcl90eXBlICE9IERSTV9NT0RFX0VOQ09ERVJfRFBNU1QpIHsKPiAgCQkJ
c3RydWN0IG5vdXZlYXVfZW5jb2RlciAqbnZfZW5jb2RlciA9Cj4gIAkJCQlub3V2ZWF1X2VuY29k
ZXIoZW5jb2Rlcik7Cj4gLQkJCW52NTBfbXN0bV9pbml0KG52X2VuY29kZXItPmRwLm1zdG0pOwo+
ICsJCQludjUwX21zdG1faW5pdChudl9lbmNvZGVyLT5kcC5tc3RtLCBydW50aW1lKTsKPiAgCQl9
Cj4gIAl9Cj4gIAo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS9kcm1fZHBfbXN0X2hlbHBlci5o
IGIvaW5jbHVkZS9kcm0vZHJtX2RwX21zdF9oZWxwZXIuaAo+IGluZGV4IDFlZmJiMDg2ZjdhYy4u
MWJkZWU1ZWU2ZGNkIDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUvZHJtL2RybV9kcF9tc3RfaGVscGVy
LmgKPiArKysgYi9pbmNsdWRlL2RybS9kcm1fZHBfbXN0X2hlbHBlci5oCj4gQEAgLTY4NSw3ICs2
ODUsOCBAQCB2b2lkIGRybV9kcF9tc3RfZHVtcF90b3BvbG9neShzdHJ1Y3Qgc2VxX2ZpbGUgKm0s
Cj4gIAo+ICB2b2lkIGRybV9kcF9tc3RfdG9wb2xvZ3lfbWdyX3N1c3BlbmQoc3RydWN0IGRybV9k
cF9tc3RfdG9wb2xvZ3lfbWdyICptZ3IpOwo+ICBpbnQgX19tdXN0X2NoZWNrCj4gLWRybV9kcF9t
c3RfdG9wb2xvZ3lfbWdyX3Jlc3VtZShzdHJ1Y3QgZHJtX2RwX21zdF90b3BvbG9neV9tZ3IgKm1n
cik7Cj4gK2RybV9kcF9tc3RfdG9wb2xvZ3lfbWdyX3Jlc3VtZShzdHJ1Y3QgZHJtX2RwX21zdF90
b3BvbG9neV9tZ3IgKm1nciwKPiArCQkJICAgICAgIGJvb2wgc3luYyk7Cj4gIAo+ICBzc2l6ZV90
IGRybV9kcF9tc3RfZHBjZF9yZWFkKHN0cnVjdCBkcm1fZHBfYXV4ICphdXgsCj4gIAkJCSAgICAg
dW5zaWduZWQgaW50IG9mZnNldCwgdm9pZCAqYnVmZmVyLCBzaXplX3Qgc2l6ZSk7Cj4gLS0gCj4g
Mi4yMS4wCj4gCgotLSAKU2VhbiBQYXVsLCBTb2Z0d2FyZSBFbmdpbmVlciwgR29vZ2xlIC8gQ2hy
b21pdW0gT1MKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
