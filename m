Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 513EA2AF36F
	for <lists+amd-gfx@lfdr.de>; Wed, 11 Nov 2020 15:23:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A33216E04A;
	Wed, 11 Nov 2020 14:23:33 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79C796E04A;
 Wed, 11 Nov 2020 14:23:32 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
 [209.85.208.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C2CA5221F1;
 Wed, 11 Nov 2020 14:23:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605104612;
 bh=xm3rQeDIh2FuZjYEyhCI9+5vLDwhs0MB53yet3dsIaE=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=dPmto1xzJ4FwUTGL7+SCYcrJcJWW52ez+kxbCClZr+loHMAapvqz8LQz+Evkc9Vuu
 +KAHrYvHOZwkw2La6X7uex32BeyKimqmO8Ofmcfvrnpb1stNfWTSlBY+XS1QVzjIoA
 Z6DKu/gGPoh0EgAddBIc+BpDBved4jgG3COWBuvg=
Received: by mail-ed1-f44.google.com with SMTP id p93so2460941edd.7;
 Wed, 11 Nov 2020 06:23:31 -0800 (PST)
X-Gm-Message-State: AOAM532U5yB+QwX5bKQtO7yTBNAh6dRXUPuC0Y5O95FpyQpL6rAF05oC
 6jrp4vRLdnw7/QGVPMwn6ga+bYtJlVNrQUuNIA==
X-Google-Smtp-Source: ABdhPJxh+77oiphOx3YcIcxiUEmfWiMYRwROdlpWqzLsSf75JddHNGi9QfuS9fuMmuFcPm/rgVNfg169e9VDB275Qg8=
X-Received: by 2002:a50:f0d4:: with SMTP id a20mr5290937edm.303.1605104609593; 
 Wed, 11 Nov 2020 06:23:29 -0800 (PST)
MIME-Version: 1.0
References: <20201109103242.19544-1-tzimmermann@suse.de>
 <20201109103242.19544-3-tzimmermann@suse.de>
In-Reply-To: <20201109103242.19544-3-tzimmermann@suse.de>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 11 Nov 2020 22:23:15 +0800
X-Gmail-Original-Message-ID: <CAAOTY__QuyEA7c4H+eSvrSdFTZttB4DXbjr6HLWoH8WovOD1eQ@mail.gmail.com>
Message-ID: <CAAOTY__QuyEA7c4H+eSvrSdFTZttB4DXbjr6HLWoH8WovOD1eQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/mediatek: Use struct dma_buf_map in GEM vmap ops
To: Thomas Zimmermann <tzimmermann@suse.de>
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
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris@chris-wilson.co.uk>, Melissa Wen <melissa.srw@gmail.com>,
 Eric Anholt <eric@anholt.net>, Huang Rui <ray.huang@amd.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Madhav Chauhan <madhav.chauhan@amd.com>,
 Sam Ravnborg <sam@ravnborg.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 Emil Velikov <emil.velikov@collabora.com>, Rob Herring <robh@kernel.org>,
 xen-devel@lists.xenproject.org, lima@lists.freedesktop.org,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 linux-rockchip@lists.infradead.org, amd-gfx@lists.freedesktop.org,
 Steven Price <steven.price@arm.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Luben Tuikov <luben.tuikov@amd.com>, Ben Skeggs <bskeggs@redhat.com>,
 Russell King <linux+etnaviv@armlinux.org.uk>, Dave Airlie <airlied@redhat.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-msm@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 etnaviv@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 spice-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 sean@poorly.run, Arunpravin <apaneers@amd.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, Sandy Huang <hjc@rock-chips.com>,
 robdclark@gmail.com, Nirmoy Das <Nirmoy.Das@amd.com>,
 Qiang Yu <yuq825@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Alex Deucher <alexander.deucher@amd.com>, freedreno@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Lucas Stach <l.stach@pengutronix.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

SGksIFRob21hczoKClRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPiDmlrwg
MjAyMOW5tDEx5pyIOeaXpSDpgLHkuIAg5LiL5Y2INjozMuWvq+mBk++8mgo+Cj4gRml4ZXMgYSBi
dWlsZCBmYWlsdXJlIHdpdGggbWVkaWF0ZWsuCj4KPiBUaGlzIGNoYW5nZSB3YXMgc3VwcG9zZWQg
dG8gYmUgcGFydCBvZiBjb21taXQgNDlhM2Y1MWRmZWVlICgiZHJtL2dlbToKPiBVc2Ugc3RydWN0
IGRtYV9idWZfbWFwIGluIEdFTSB2bWFwIG9wcyBhbmQgY29udmVydCBHRU0gYmFja2VuZHMiKSwg
YnV0Cj4gbWVkaWF0ZWsgd2FzIGZvcmdvdHRlbi4KCkFja2VkLWJ5OiBDaHVuLUt1YW5nIEh1IDxj
aHVua3VhbmcuaHVAa2VybmVsLm9yZz4KCj4KPiBTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgWmltbWVy
bWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4KPiBGaXhlczogNDlhM2Y1MWRmZWVlICgiZHJtL2dl
bTogVXNlIHN0cnVjdCBkbWFfYnVmX21hcCBpbiBHRU0gdm1hcCBvcHMgYW5kIGNvbnZlcnQgR0VN
IGJhY2tlbmRzIikKPiBDYzogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+
Cj4gQ2M6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KPiBDYzog
RGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgo+IENjOiBEYW5pZWwgVmV0dGVyIDxkYW5p
ZWxAZmZ3bGwuY2g+Cj4gQ2M6IE1hYXJ0ZW4gTGFua2hvcnN0IDxtYWFydGVuLmxhbmtob3JzdEBs
aW51eC5pbnRlbC5jb20+Cj4gQ2M6IE1heGltZSBSaXBhcmQgPG1yaXBhcmRAa2VybmVsLm9yZz4K
PiBDYzogRGF2ZSBBaXJsaWUgPGFpcmxpZWRAcmVkaGF0LmNvbT4KPiBDYzogTHVjYXMgU3RhY2gg
PGwuc3RhY2hAcGVuZ3V0cm9uaXguZGU+Cj4gQ2M6IFJ1c3NlbGwgS2luZyA8bGludXgrZXRuYXZp
dkBhcm1saW51eC5vcmcudWs+Cj4gQ2M6IENocmlzdGlhbiBHbWVpbmVyIDxjaHJpc3RpYW4uZ21l
aW5lckBnbWFpbC5jb20+Cj4gQ2M6IFFpYW5nIFl1IDx5dXE4MjVAZ21haWwuY29tPgo+IENjOiBC
ZW4gU2tlZ2dzIDxic2tlZ2dzQHJlZGhhdC5jb20+Cj4gQ2M6IFJvYiBIZXJyaW5nIDxyb2JoQGtl
cm5lbC5vcmc+Cj4gQ2M6IFRvbWV1IFZpem9zbyA8dG9tZXUudml6b3NvQGNvbGxhYm9yYS5jb20+
Cj4gQ2M6IFN0ZXZlbiBQcmljZSA8c3RldmVuLnByaWNlQGFybS5jb20+Cj4gQ2M6IEFseXNzYSBS
b3Nlbnp3ZWlnIDxhbHlzc2Eucm9zZW56d2VpZ0Bjb2xsYWJvcmEuY29tPgo+IENjOiBHZXJkIEhv
ZmZtYW5uIDxrcmF4ZWxAcmVkaGF0LmNvbT4KPiBDYzogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIu
ZGV1Y2hlckBhbWQuY29tPgo+IENjOiAiQ2hyaXN0aWFuIEvDtm5pZyIgPGNocmlzdGlhbi5rb2Vu
aWdAYW1kLmNvbT4KPiBDYzogU2FuZHkgSHVhbmcgPGhqY0Byb2NrLWNoaXBzLmNvbT4KPiBDYzog
IkhlaWtvIFN0w7xibmVyIiA8aGVpa29Ac250ZWNoLmRlPgo+IENjOiBIYW5zIGRlIEdvZWRlIDxo
ZGVnb2VkZUByZWRoYXQuY29tPgo+IENjOiBTZWFuIFBhdWwgPHNlYW5AcG9vcmx5LnJ1bj4KPiBD
YzogRXJpYyBBbmhvbHQgPGVyaWNAYW5ob2x0Lm5ldD4KPiBDYzogUm9kcmlnbyBTaXF1ZWlyYSA8
cm9kcmlnb3NpcXVlaXJhbWVsb0BnbWFpbC5jb20+Cj4gQ2M6IE1lbGlzc2EgV2VuIDxtZWxpc3Nh
LnNyd0BnbWFpbC5jb20+Cj4gQ2M6IEhhbmVlbiBNb2hhbW1lZCA8aGFtb2hhbW1lZC5zYUBnbWFp
bC5jb20+Cj4gQ2M6IE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIDxvbGVrc2FuZHJfYW5kcnVzaGNo
ZW5rb0BlcGFtLmNvbT4KPiBDYzogU3VtaXQgU2Vtd2FsIDxzdW1pdC5zZW13YWxAbGluYXJvLm9y
Zz4KPiBDYzogRW1pbCBWZWxpa292IDxlbWlsLnZlbGlrb3ZAY29sbGFib3JhLmNvbT4KPiBDYzog
TWFyZWsgU3p5cHJvd3NraSA8bS5zenlwcm93c2tpQHNhbXN1bmcuY29tPgo+IENjOiBBcnVucHJh
dmluIDxhcGFuZWVyc0BhbWQuY29tPgo+IENjOiBIdWFuZyBSdWkgPHJheS5odWFuZ0BhbWQuY29t
Pgo+IENjOiBMdWJlbiBUdWlrb3YgPGx1YmVuLnR1aWtvdkBhbWQuY29tPgo+IENjOiBNYWRoYXYg
Q2hhdWhhbiA8bWFkaGF2LmNoYXVoYW5AYW1kLmNvbT4KPiBDYzogTmlybW95IERhcyA8TmlybW95
LkRhc0BhbWQuY29tPgo+IENjOiBKYXNvbiBHdW50aG9ycGUgPGpnZ0B6aWVwZS5jYT4KPiBDYzog
U2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPgo+IENjOiBDaHJpcyBXaWxzb24gPGNocmlz
QGNocmlzLXdpbHNvbi5jby51az4KPiBDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
Zwo+IENjOiBldG5hdml2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IENjOiBsaW1hQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwo+IENjOiBub3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IENjOiB2
aXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwo+IENjOiBzcGljZS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBDYzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKPiBDYzogbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCj4gQ2M6IGxpbnV4
LXJvY2tjaGlwQGxpc3RzLmluZnJhZGVhZC5vcmcKPiBDYzogeGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2dlbS5j
IHwgMjAgKysrKysrKysrKysrLS0tLS0tLS0KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210
a19kcm1fZ2VtLmggfCAgNCArKy0tCj4gIDIgZmlsZXMgY2hhbmdlZCwgMTQgaW5zZXJ0aW9ucygr
KSwgMTAgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlh
dGVrL210a19kcm1fZ2VtLmMgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9nZW0u
Ywo+IGluZGV4IGNkZDFhNmU2MTU2NC4uMjhhMmVlMTMzNmVmIDEwMDY0NAo+IC0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2dlbS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L21lZGlhdGVrL210a19kcm1fZ2VtLmMKPiBAQCAtMjQwLDIzICsyNDAsMjUgQEAgc3RydWN0IGRy
bV9nZW1fb2JqZWN0ICptdGtfZ2VtX3ByaW1lX2ltcG9ydF9zZ190YWJsZShzdHJ1Y3QgZHJtX2Rl
dmljZSAqZGV2LAo+ICAgICAgICAgcmV0dXJuICZtdGtfZ2VtLT5iYXNlOwo+ICB9Cj4KPiAtdm9p
ZCAqbXRrX2RybV9nZW1fcHJpbWVfdm1hcChzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKm9iaikKPiAr
aW50IG10a19kcm1fZ2VtX3ByaW1lX3ZtYXAoc3RydWN0IGRybV9nZW1fb2JqZWN0ICpvYmosIHN0
cnVjdCBkbWFfYnVmX21hcCAqbWFwKQo+ICB7Cj4gICAgICAgICBzdHJ1Y3QgbXRrX2RybV9nZW1f
b2JqICptdGtfZ2VtID0gdG9fbXRrX2dlbV9vYmoob2JqKTsKPiAtICAgICAgIHN0cnVjdCBzZ190
YWJsZSAqc2d0Owo+ICsgICAgICAgc3RydWN0IHNnX3RhYmxlICpzZ3QgPSBOVUxMOwo+ICAgICAg
ICAgdW5zaWduZWQgaW50IG5wYWdlczsKPgo+ICAgICAgICAgaWYgKG10a19nZW0tPmt2YWRkcikK
PiAtICAgICAgICAgICAgICAgcmV0dXJuIG10a19nZW0tPmt2YWRkcjsKPiArICAgICAgICAgICAg
ICAgZ290byBvdXQ7Cj4KPiAgICAgICAgIHNndCA9IG10a19nZW1fcHJpbWVfZ2V0X3NnX3RhYmxl
KG9iaik7Cj4gICAgICAgICBpZiAoSVNfRVJSKHNndCkpCj4gLSAgICAgICAgICAgICAgIHJldHVy
biBOVUxMOwo+ICsgICAgICAgICAgICAgICByZXR1cm4gUFRSX0VSUihzZ3QpOwo+Cj4gICAgICAg
ICBucGFnZXMgPSBvYmotPnNpemUgPj4gUEFHRV9TSElGVDsKPiAgICAgICAgIG10a19nZW0tPnBh
Z2VzID0ga2NhbGxvYyhucGFnZXMsIHNpemVvZigqbXRrX2dlbS0+cGFnZXMpLCBHRlBfS0VSTkVM
KTsKPiAtICAgICAgIGlmICghbXRrX2dlbS0+cGFnZXMpCj4gLSAgICAgICAgICAgICAgIGdvdG8g
b3V0Owo+ICsgICAgICAgaWYgKCFtdGtfZ2VtLT5wYWdlcykgewo+ICsgICAgICAgICAgICAgICBr
ZnJlZShzZ3QpOwo+ICsgICAgICAgICAgICAgICByZXR1cm4gLUVOT01FTTsKPiArICAgICAgIH0K
Pgo+ICAgICAgICAgZHJtX3ByaW1lX3NnX3RvX3BhZ2VfYWRkcl9hcnJheXMoc2d0LCBtdGtfZ2Vt
LT5wYWdlcywgTlVMTCwgbnBhZ2VzKTsKPgo+IEBAIC0yNjUsMTMgKzI2NywxNSBAQCB2b2lkICpt
dGtfZHJtX2dlbV9wcmltZV92bWFwKHN0cnVjdCBkcm1fZ2VtX29iamVjdCAqb2JqKQo+Cj4gIG91
dDoKPiAgICAgICAgIGtmcmVlKHNndCk7Cj4gKyAgICAgICBkbWFfYnVmX21hcF9zZXRfdmFkZHIo
bWFwLCBtdGtfZ2VtLT5rdmFkZHIpOwo+Cj4gLSAgICAgICByZXR1cm4gbXRrX2dlbS0+a3ZhZGRy
Owo+ICsgICAgICAgcmV0dXJuIDA7Cj4gIH0KPgo+IC12b2lkIG10a19kcm1fZ2VtX3ByaW1lX3Z1
bm1hcChzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKm9iaiwgdm9pZCAqdmFkZHIpCj4gK3ZvaWQgbXRr
X2RybV9nZW1fcHJpbWVfdnVubWFwKHN0cnVjdCBkcm1fZ2VtX29iamVjdCAqb2JqLCBzdHJ1Y3Qg
ZG1hX2J1Zl9tYXAgKm1hcCkKPiAgewo+ICAgICAgICAgc3RydWN0IG10a19kcm1fZ2VtX29iaiAq
bXRrX2dlbSA9IHRvX210a19nZW1fb2JqKG9iaik7Cj4gKyAgICAgICB2b2lkICp2YWRkciA9IG1h
cC0+dmFkZHI7Cj4KPiAgICAgICAgIGlmICghbXRrX2dlbS0+cGFnZXMpCj4gICAgICAgICAgICAg
ICAgIHJldHVybjsKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19k
cm1fZ2VtLmggYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9nZW0uaAo+IGluZGV4
IGZmOWY5NzZkOTgwNy4uNmRhNWNjYjRiOTMzIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9tZWRpYXRlay9tdGtfZHJtX2dlbS5oCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVr
L210a19kcm1fZ2VtLmgKPiBAQCAtNDUsNyArNDUsNyBAQCBpbnQgbXRrX2RybV9nZW1fbW1hcF9i
dWYoc3RydWN0IGRybV9nZW1fb2JqZWN0ICpvYmosCj4gIHN0cnVjdCBzZ190YWJsZSAqbXRrX2dl
bV9wcmltZV9nZXRfc2dfdGFibGUoc3RydWN0IGRybV9nZW1fb2JqZWN0ICpvYmopOwo+ICBzdHJ1
Y3QgZHJtX2dlbV9vYmplY3QgKm10a19nZW1fcHJpbWVfaW1wb3J0X3NnX3RhYmxlKHN0cnVjdCBk
cm1fZGV2aWNlICpkZXYsCj4gICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IGRtYV9idWZf
YXR0YWNobWVudCAqYXR0YWNoLCBzdHJ1Y3Qgc2dfdGFibGUgKnNnKTsKPiAtdm9pZCAqbXRrX2Ry
bV9nZW1fcHJpbWVfdm1hcChzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKm9iaik7Cj4gLXZvaWQgbXRr
X2RybV9nZW1fcHJpbWVfdnVubWFwKHN0cnVjdCBkcm1fZ2VtX29iamVjdCAqb2JqLCB2b2lkICp2
YWRkcik7Cj4gK2ludCBtdGtfZHJtX2dlbV9wcmltZV92bWFwKHN0cnVjdCBkcm1fZ2VtX29iamVj
dCAqb2JqLCBzdHJ1Y3QgZG1hX2J1Zl9tYXAgKm1hcCk7Cj4gK3ZvaWQgbXRrX2RybV9nZW1fcHJp
bWVfdnVubWFwKHN0cnVjdCBkcm1fZ2VtX29iamVjdCAqb2JqLCBzdHJ1Y3QgZG1hX2J1Zl9tYXAg
Km1hcCk7Cj4KPiAgI2VuZGlmCj4gLS0KPiAyLjI5LjIKPgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2FtZC1nZngK
