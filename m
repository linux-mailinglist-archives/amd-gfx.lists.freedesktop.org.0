Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E0FBEBE60B
	for <lists+amd-gfx@lfdr.de>; Wed, 25 Sep 2019 22:03:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BFE16F845;
	Wed, 25 Sep 2019 20:03:30 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-yw1-xc42.google.com (mail-yw1-xc42.google.com
 [IPv6:2607:f8b0:4864:20::c42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A042B6F83C
 for <amd-gfx@lists.freedesktop.org>; Wed, 25 Sep 2019 20:03:29 +0000 (UTC)
Received: by mail-yw1-xc42.google.com with SMTP id n11so2537702ywn.6
 for <amd-gfx@lists.freedesktop.org>; Wed, 25 Sep 2019 13:03:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=gNDpa6gJwz6+/gmM6XlycDMJYVpDkuYsHcCA8nLLghc=;
 b=ikJ7PqkI9Uh2KFsaE7ZzU+vpAebsEnB6FTgSOn4N9IqIO3zyPiYFPC0MqKFWsdzfEi
 sa4aebNTNtVM3COaez9n1p5GE2K/IzSKm+duy/U0Sf8EMzN/Az5WSbtDNJAYqiJrfCwu
 AlSUgNnheM5SQxsdAACtQHQUcVAFVev5O/mlBNkq87uJ6QjlP/gGQPbL8cPcAJowUHIS
 yRH3JdfjrAHTqc+tOtSbhtJm6tHhuMa6nlaye3fTQ6P2IOJLLHyqryNL/+DHfw3b30PK
 bo5g26gjFN4P1Mq0RiUgFOFNN0lCXFecy+2wFe+xFpXNU2dsfuMxyWP5YvODLrL2Gonj
 niIA==
X-Gm-Message-State: APjAAAWH1k62XD0B+0V/5EQ8t9E7qCOWoaFfUZJnXSgUqanPu8Db/uzk
 GADC5WMXP4kYhtIbNj7LhT9ZVA==
X-Google-Smtp-Source: APXvYqybjE98I3XzxOFxhiamePgEVdQzYmAtObwGqV9JghEh9eyMk6WahEMb49DGzRgcWOd/SB1yfQ==
X-Received: by 2002:a0d:f7c3:: with SMTP id h186mr7205518ywf.274.1569441808731; 
 Wed, 25 Sep 2019 13:03:28 -0700 (PDT)
Received: from localhost ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id w123sm1525538yww.22.2019.09.25.13.03.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Sep 2019 13:03:28 -0700 (PDT)
Date: Wed, 25 Sep 2019 16:03:27 -0400
From: Sean Paul <sean@poorly.run>
To: Lyude Paul <lyude@redhat.com>
Subject: Re: [PATCH v2 21/27] drm/dp_mst: Don't forget to update port->input
 in drm_dp_mst_handle_conn_stat()
Message-ID: <20190925200327.GM218215@art_vandelay>
References: <20190903204645.25487-1-lyude@redhat.com>
 <20190903204645.25487-22-lyude@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190903204645.25487-22-lyude@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=gNDpa6gJwz6+/gmM6XlycDMJYVpDkuYsHcCA8nLLghc=;
 b=CV/RkG/QeEmc3lrACMXzreW1kQ6ZJRF4DFyXRg3rVVgLM+z4am0pntR1KHPZ5jzydb
 aAiGL8cGzFhH1Yl8/VDOsKZlTfa6ftGn4Jfe02REa+Sn9OItqCN+cysicscRDFYMFoMt
 OuIaEn2YB8oZ+QpecF7z6IqWNkBAZVkXS7cxjIvOT9ouygI+qsePFqWHH0ijo0WGB7tU
 GWnH+JBY0YN2/3CZ//Qwd9jmN/OC+GQ8hrE2SfaVxmmcHn3VtcT9z90m+Ux2g1obw1RZ
 I4sPuhpasfsf49XVoIFEZ8Bty6CBvfTasQvEoqSwpZ+w+wTvPFmjLVEINe/y/eF/A5ip
 GPSg==
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
Cc: Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 Imre Deak <imre.deak@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Sean Paul <sean@poorly.run>, Juston Li <juston.li@intel.com>,
 Daniel Vetter <daniel@ffwll.ch>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Harry Wentland <hwentlan@amd.com>,
 Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gVHVlLCBTZXAgMDMsIDIwMTkgYXQgMDQ6NDU6NTlQTSAtMDQwMCwgTHl1ZGUgUGF1bCB3cm90
ZToKPiBUaGlzIHByb2JhYmx5IGhhc24ndCBjYXVzZWQgYW55IHByb2JsZW1zIHVwIHVudGlsIG5v
dyBzaW5jZSBpdCdzCj4gcHJvYmFibHkgbmVhcmx5IGltcG9zc2libGUgdG8gZW5jb3VudGVyIHRo
aXMgaW4gdGhlIHdpbGQsIGhvd2V2ZXIgaWYgd2UKPiB3ZXJlIHRvIHJlY2VpdmUgYSBjb25uZWN0
aW9uIHN0YXR1cyBub3RpZmljYXRpb24gZnJvbSB0aGUgTVNUIGh1YiBhZnRlcgo+IHJlc3VtZSB3
aGlsZSB3ZSdyZSBpbiB0aGUgbWlkZGxlIG9mIHJlcHJvYmluZyB0aGUgbGluayBhZGRyZXNzZXMg
Zm9yIGEKPiB0b3BvbG9neSB0aGVuIHRoZXJlJ3MgYSBtdWNoIGxhcmdlciBjaGFuY2UgdGhhdCBh
IHBvcnQgY291bGQgaGF2ZQo+IGNoYW5nZWQgZnJvbSBiZWluZyBhbiBvdXRwdXQgcG9ydCB0byBp
bnB1dCBwb3J0IChvciB2aWNlIHZlcnNhKS4gSWYgd2UKPiBmb3JnZXQgdG8gdXBkYXRlIHRoaXMg
Yml0IG9mIGluZm9ybWF0aW9uLCB3ZSdsbCBwb3RlbnRpYWxseSBpZ25vcmUgYQo+IHZhbGlkIFBE
VCBjaGFuZ2Ugb24gYSBkb3duc3RyZWFtIHBvcnQgYmVjYXVzZSB3ZSB0aGluayBpdCdzIGFuIGlu
cHV0Cj4gcG9ydC4KPiAKPiBTbywgbWFrZSBzdXJlIHdlIHJlYWQgdGhlIGlucHV0X3BvcnQgZmll
bGQgaW4gY29ubmVjdGlvbiBzdGF0dXMKPiBub3RpZmljYXRpb25zIGluIGRybV9kcF9tc3RfaGFu
ZGxlX2Nvbm5fc3RhdCgpIHRvIHByZXZlbnQgdGhpcyBmcm9tCj4gaGFwcGVuaW5nIG9uY2Ugd2Un
dmUgaW1wbGVtZW50ZWQgc3VzcGVuZC9yZXN1bWUgcmVwcm9iaW5nLgo+IAo+IENjOiBKdXN0b24g
TGkgPGp1c3Rvbi5saUBpbnRlbC5jb20+Cj4gQ2M6IEltcmUgRGVhayA8aW1yZS5kZWFrQGludGVs
LmNvbT4KPiBDYzogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNv
bT4KPiBDYzogSGFycnkgV2VudGxhbmQgPGh3ZW50bGFuQGFtZC5jb20+Cj4gQ2M6IERhbmllbCBW
ZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+Cj4gU2lnbmVkLW9mZi1ieTogTHl1ZGUgUGF1
bCA8bHl1ZGVAcmVkaGF0LmNvbT4KCk5pY2UgY2F0Y2ghIFNhbWUgY29tbWVudCBoZXJlIHJlOiBw
b3J0LT5tdXRleCwgYnV0IHdlIGNhbiBzb3J0IHRoYXQgb3V0IG9uIHRoZQpvdGhlciB0aHJlYWQK
ClJldmlld2VkLWJ5OiBTZWFuIFBhdWwgPHNlYW5AcG9vcmx5LnJ1bj4KCgo+IC0tLQo+ICBkcml2
ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5jIHwgNTEgKysrKysrKysrKysrKysrKysr
Ky0tLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAzNyBpbnNlcnRpb25zKCspLCAxNCBkZWxldGlv
bnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9tc3RfdG9wb2xv
Z3kuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMKPiBpbmRleCAyNTk2
MzRjNWQ2ZGMuLmU0MDdhYmExZmJkMiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJt
X2RwX21zdF90b3BvbG9neS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9tc3RfdG9w
b2xvZ3kuYwo+IEBAIC0yMDc4LDE4ICsyMDc4LDIzIEBAIHN0YXRpYyB2b2lkCj4gIGRybV9kcF9t
c3RfaGFuZGxlX2Nvbm5fc3RhdChzdHJ1Y3QgZHJtX2RwX21zdF9icmFuY2ggKm1zdGIsCj4gIAkJ
CSAgICBzdHJ1Y3QgZHJtX2RwX2Nvbm5lY3Rpb25fc3RhdHVzX25vdGlmeSAqY29ubl9zdGF0KQo+
ICB7Cj4gLQlzdHJ1Y3QgZHJtX2RldmljZSAqZGV2ID0gbXN0Yi0+bWdyLT5kZXY7Cj4gKwlzdHJ1
Y3QgZHJtX2RwX21zdF90b3BvbG9neV9tZ3IgKm1nciA9IG1zdGItPm1ncjsKPiArCXN0cnVjdCBk
cm1fZGV2aWNlICpkZXYgPSBtZ3ItPmRldjsKPiAgCXN0cnVjdCBkcm1fZHBfbXN0X3BvcnQgKnBv
cnQ7Cj4gLQlpbnQgb2xkX2RkcHM7Cj4gLQlib29sIGRvd29yayA9IGZhbHNlOwo+ICsJc3RydWN0
IGRybV9jb25uZWN0b3IgKmNvbm5lY3Rvcl90b19kZXN0cm95ID0gTlVMTDsKPiArCWludCBvbGRf
ZGRwcywgcmV0Owo+ICsJdTggbmV3X3BkdDsKPiArCWJvb2wgZG93b3JrID0gZmFsc2UsIGNyZWF0
ZV9jb25uZWN0b3IgPSBmYWxzZTsKPiAgCj4gIAlwb3J0ID0gZHJtX2RwX2dldF9wb3J0KG1zdGIs
IGNvbm5fc3RhdC0+cG9ydF9udW1iZXIpOwo+ICAJaWYgKCFwb3J0KQo+ICAJCXJldHVybjsKPiAg
Cj4gKwltdXRleF9sb2NrKCZwb3J0LT5sb2NrKTsKPiAgCWRybV9tb2Rlc2V0X2xvY2soJmRldi0+
bW9kZV9jb25maWcuY29ubmVjdGlvbl9tdXRleCwgTlVMTCk7Cj4gIAo+ICAJb2xkX2RkcHMgPSBw
b3J0LT5kZHBzOwo+ICsJcG9ydC0+aW5wdXQgPSBjb25uX3N0YXQtPmlucHV0X3BvcnQ7Cj4gIAlw
b3J0LT5tY3MgPSBjb25uX3N0YXQtPm1lc3NhZ2VfY2FwYWJpbGl0eV9zdGF0dXM7Cj4gIAlwb3J0
LT5sZHBzID0gY29ubl9zdGF0LT5sZWdhY3lfZGV2aWNlX3BsdWdfc3RhdHVzOwo+ICAJcG9ydC0+
ZGRwcyA9IGNvbm5fc3RhdC0+ZGlzcGxheXBvcnRfZGV2aWNlX3BsdWdfc3RhdHVzOwo+IEBAIC0y
MTAyLDIzICsyMTA3LDQxIEBAIGRybV9kcF9tc3RfaGFuZGxlX2Nvbm5fc3RhdChzdHJ1Y3QgZHJt
X2RwX21zdF9icmFuY2ggKm1zdGIsCj4gIAkJfQo+ICAJfQo+ICAKPiAtCWlmICghcG9ydC0+aW5w
dXQpIHsKPiAtCQlpbnQgcmV0ID0gZHJtX2RwX3BvcnRfc2V0X3BkdChwb3J0LAo+IC0JCQkJCSAg
ICAgIGNvbm5fc3RhdC0+cGVlcl9kZXZpY2VfdHlwZSk7Cj4gLQkJaWYgKHJldCA9PSAxKSB7Cj4g
LQkJCWRvd29yayA9IHRydWU7Cj4gLQkJfSBlbHNlIGlmIChyZXQgPCAwKSB7Cj4gLQkJCURSTV9F
UlJPUigiRmFpbGVkIHRvIGNoYW5nZSBQRFQgZm9yIHBvcnQgJXA6ICVkXG4iLAo+IC0JCQkJICBw
b3J0LCByZXQpOwo+IC0JCQlkb3dvcmsgPSBmYWxzZTsKPiAtCQl9Cj4gKwluZXdfcGR0ID0gcG9y
dC0+aW5wdXQgPyBEUF9QRUVSX0RFVklDRV9OT05FIDogY29ubl9zdGF0LT5wZWVyX2RldmljZV90
eXBlOwo+ICsKPiArCXJldCA9IGRybV9kcF9wb3J0X3NldF9wZHQocG9ydCwgbmV3X3BkdCk7Cj4g
KwlpZiAocmV0ID09IDEpIHsKPiArCQlkb3dvcmsgPSB0cnVlOwo+ICsJfSBlbHNlIGlmIChyZXQg
PCAwKSB7Cj4gKwkJRFJNX0VSUk9SKCJGYWlsZWQgdG8gY2hhbmdlIFBEVCBmb3IgcG9ydCAlcDog
JWRcbiIsCj4gKwkJCSAgcG9ydCwgcmV0KTsKPiArCQlkb3dvcmsgPSBmYWxzZTsKPiArCX0KPiAr
Cj4gKwkvKgo+ICsJICogV2UgdW5zZXQgcG9ydC0+Y29ubmVjdG9yIGJlZm9yZSBkcm9wcGluZyBj
b25uZWN0aW9uX211dGV4IHNvIHRoYXQKPiArCSAqIHRoZXJlJ3Mgbm8gY2hhbmNlIGFueSBvZiB0
aGUgYXRvbWljIE1TVCBoZWxwZXJzIGNhbiBhY2NpZGVudGFsbHkKPiArCSAqIGFzc29jaWF0ZSBh
IHRvLWJlLWRlc3Ryb3llZCBjb25uZWN0b3Igd2l0aCBhIHBvcnQuCj4gKwkgKi8KPiArCWlmIChw
b3J0LT5jb25uZWN0b3IgJiYgcG9ydC0+aW5wdXQpIHsKPiArCQljb25uZWN0b3JfdG9fZGVzdHJv
eSA9IHBvcnQtPmNvbm5lY3RvcjsKPiArCQlwb3J0LT5jb25uZWN0b3IgPSBOVUxMOwo+ICsJfSBl
bHNlIGlmICghcG9ydC0+Y29ubmVjdG9yICYmICFwb3J0LT5pbnB1dCkgewo+ICsJCWNyZWF0ZV9j
b25uZWN0b3IgPSB0cnVlOwo+ICAJfQo+ICAKPiAgCWRybV9tb2Rlc2V0X3VubG9jaygmZGV2LT5t
b2RlX2NvbmZpZy5jb25uZWN0aW9uX211dGV4KTsKPiArCj4gKwlpZiAoY29ubmVjdG9yX3RvX2Rl
c3Ryb3kpCj4gKwkJbWdyLT5jYnMtPmRlc3Ryb3lfY29ubmVjdG9yKG1nciwgY29ubmVjdG9yX3Rv
X2Rlc3Ryb3kpOwo+ICsJZWxzZSBpZiAoY3JlYXRlX2Nvbm5lY3RvcikKPiArCQlkcm1fZHBfbXN0
X3BvcnRfYWRkX2Nvbm5lY3Rvcihtc3RiLCBwb3J0KTsKPiArCj4gKwltdXRleF91bmxvY2soJnBv
cnQtPmxvY2spOwo+ICsKPiAgCWRybV9kcF9tc3RfdG9wb2xvZ3lfcHV0X3BvcnQocG9ydCk7Cj4g
IAlpZiAoZG93b3JrKQo+ICAJCXF1ZXVlX3dvcmsoc3lzdGVtX2xvbmdfd3EsICZtc3RiLT5tZ3It
PndvcmspOwo+IC0KPiAgfQo+ICAKPiAgc3RhdGljIHN0cnVjdCBkcm1fZHBfbXN0X2JyYW5jaCAq
ZHJtX2RwX2dldF9tc3RfYnJhbmNoX2RldmljZShzdHJ1Y3QgZHJtX2RwX21zdF90b3BvbG9neV9t
Z3IgKm1nciwKPiAtLSAKPiAyLjIxLjAKPiAKCi0tIApTZWFuIFBhdWwsIFNvZnR3YXJlIEVuZ2lu
ZWVyLCBHb29nbGUgLyBDaHJvbWl1bSBPUwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2FtZC1nZng=
