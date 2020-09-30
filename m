Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FC4B27E8F5
	for <lists+amd-gfx@lfdr.de>; Wed, 30 Sep 2020 14:52:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0836E6E570;
	Wed, 30 Sep 2020 12:52:00 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com
 [IPv6:2607:f8b0:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FE536E7D9
 for <amd-gfx@lists.freedesktop.org>; Wed, 30 Sep 2020 12:51:58 +0000 (UTC)
Received: by mail-ot1-x341.google.com with SMTP id a2so1647370otr.11
 for <amd-gfx@lists.freedesktop.org>; Wed, 30 Sep 2020 05:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=0wPhcg2LSZHu/TGS7lNnmy/csXQmnvXJn2oVG4UhCFU=;
 b=XquRtfZkI3Z1/dyelbhmy6+S3LdOrJ+Ls99zb0gNP1isZ5/ROkggvmrEz/emoeYGWy
 +7WV2wttZIrKzGps4H/VfZv8ipVy3amtJxb5yY3hYY3sY9T+XmpNAPp9usVKoA9ucM8I
 yFhLFNdvMezP74CymnCXqb+/GWbzizh3ybux8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=0wPhcg2LSZHu/TGS7lNnmy/csXQmnvXJn2oVG4UhCFU=;
 b=IHlbs+wTkix2fPnwEqgetdbCazC0lQ+Rj/ICjnS+OUtwVpdsaskEpopFnVGbfsKN5l
 GU1MqmuKqN00YSfcXaYBTxjsHOOYoCuUZHsh838FofEoeuNsfQxKIsdlfBATOYje39+Q
 hxI5FFMUR28HDMnc76/BmKskS8J8VJDcojei/r+4gP2O+Lur+FMQ3zYNL8i7WZIz3W9c
 PlHUOp3w5mMh1aPse2BI7PjJxZR/itR4yH0TRJ47O3b6gf45dSN8mDJLYdymk68v8QNk
 FCnFg73auPTO7LJSFSJRhXP8mZFLgoXhyvFJUNG4NPURJQN5JkAyBsgSwkgf/6d7bbV9
 Mnzw==
X-Gm-Message-State: AOAM530I4gGuglcJ411vX9lPGrNXla0T2HKGoMUE4ok0yTMVBSK4Ekbw
 /2JN6eokwzHQXSWK8MscRP1Tr1HghiesfwegzlA0GA==
X-Google-Smtp-Source: ABdhPJxxpGai/lgr0vj7vZLBdjw/nwkhoKL0Cu07SVu0LJH3S5jKfA3Xrm3c1q+2d1FIg6dGQXev7SEllIxIp/8QKPM=
X-Received: by 2002:a05:6830:14d9:: with SMTP id
 t25mr1567057otq.188.1601470317809; 
 Wed, 30 Sep 2020 05:51:57 -0700 (PDT)
MIME-Version: 1.0
References: <20200929151437.19717-1-tzimmermann@suse.de>
 <20200929151437.19717-3-tzimmermann@suse.de>
 <8fad0114-064a-4ed5-c21d-d1b4294de0a1@amd.com>
 <2614314a-81f7-4722-c400-68d90e48e09a@suse.de>
 <8a84f62b-33f3-f44c-52af-c859a0e0d1fb@gmail.com>
 <07972ada-9135-3743-a86b-487f610c509f@suse.de>
 <b569b7e3-68f0-edcc-c8f4-170e9042d348@gmail.com>
 <20200930094712.GW438822@phenom.ffwll.local>
 <8479d0aa-3826-4f37-0109-55daca515793@amd.com>
In-Reply-To: <8479d0aa-3826-4f37-0109-55daca515793@amd.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 30 Sep 2020 14:51:46 +0200
Message-ID: <CAKMK7uH0U36NG8w98i0x6HVGeogiwnYDRiKquLW-8znLa7-0yg@mail.gmail.com>
Subject: Re: [PATCH v3 2/7] drm/ttm: Add ttm_kmap_obj_to_dma_buf_map() for
 type conversion
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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
Cc: Luben Tuikov <luben.tuikov@amd.com>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Dave Airlie <airlied@linux.ie>, Nouveau Dev <nouveau@lists.freedesktop.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, "Wilson,
 Chris" <chris@chris-wilson.co.uk>, Melissa Wen <melissa.srw@gmail.com>,
 "Anholt, Eric" <eric@anholt.net>, Huang Rui <ray.huang@amd.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Sam Ravnborg <sam@ravnborg.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Emil Velikov <emil.velikov@collabora.com>, Rob Herring <robh@kernel.org>,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 Joonyoung Shim <jy0922.shim@samsung.com>, lima@lists.freedesktop.org,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Steven Price <steven.price@arm.com>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 Kukjin Kim <kgene@kernel.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 "open list:DRM DRIVER FOR QXL VIRTUAL GPU" <spice-devel@lists.freedesktop.org>,
 Ben Skeggs <bskeggs@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 The etnaviv authors <etnaviv@lists.freedesktop.org>,
 Maxime Ripard <mripard@kernel.org>, Inki Dae <inki.dae@samsung.com>,
 Hans de Goede <hdegoede@redhat.com>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 "moderated list:DRM DRIVERS FOR XEN" <xen-devel@lists.xenproject.org>,
 "open list:VIRTIO CORE, NET..." <virtualization@lists.linux-foundation.org>,
 Sean Paul <sean@poorly.run>, apaneers@amd.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, Sandy Huang <hjc@rock-chips.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Qinglang Miao <miaoqinglang@huawei.com>, Qiang Yu <yuq825@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>,
 Lucas Stach <l.stach@pengutronix.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gV2VkLCBTZXAgMzAsIDIwMjAgYXQgMjozNCBQTSBDaHJpc3RpYW4gS8O2bmlnCjxjaHJpc3Rp
YW4ua29lbmlnQGFtZC5jb20+IHdyb3RlOgo+Cj4gQW0gMzAuMDkuMjAgdW0gMTE6NDcgc2Nocmll
YiBEYW5pZWwgVmV0dGVyOgo+ID4gT24gV2VkLCBTZXAgMzAsIDIwMjAgYXQgMTA6MzQ6MzFBTSAr
MDIwMCwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToKPiA+PiBBbSAzMC4wOS4yMCB1bSAxMDoxOSBz
Y2hyaWViIFRob21hcyBaaW1tZXJtYW5uOgo+ID4+PiBIaQo+ID4+Pgo+ID4+PiBBbSAzMC4wOS4y
MCB1bSAxMDowNSBzY2hyaWViIENocmlzdGlhbiBLw7ZuaWc6Cj4gPj4+PiBBbSAyOS4wOS4yMCB1
bSAxOTo0OSBzY2hyaWViIFRob21hcyBaaW1tZXJtYW5uOgo+ID4+Pj4+IEhpIENocmlzdGlhbgo+
ID4+Pj4+Cj4gPj4+Pj4gQW0gMjkuMDkuMjAgdW0gMTc6MzUgc2NocmllYiBDaHJpc3RpYW4gS8O2
bmlnOgo+ID4+Pj4+PiBBbSAyOS4wOS4yMCB1bSAxNzoxNCBzY2hyaWViIFRob21hcyBaaW1tZXJt
YW5uOgo+ID4+Pj4+Pj4gVGhlIG5ldyBoZWxwZXIgdHRtX2ttYXBfb2JqX3RvX2RtYV9idWYoKSBl
eHRyYWN0cyBhZGRyZXNzIGFuZCBsb2NhdGlvbgo+ID4+Pj4+Pj4gZnJvbSBhbmQgaW5zdGFuY2Ug
b2YgVFRNJ3Mga21hcF9vYmogYW5kIGluaXRpYWxpemVzIHN0cnVjdCBkbWFfYnVmX21hcAo+ID4+
Pj4+Pj4gd2l0aCB0aGVzZSB2YWx1ZXMuIEhlbHBmdWwgZm9yIFRUTS1iYXNlZCBkcml2ZXJzLgo+
ID4+Pj4+PiBXZSBjb3VsZCBjb21wbGV0ZWx5IGRyb3AgdGhhdCBpZiB3ZSB1c2UgdGhlIHNhbWUg
c3RydWN0dXJlIGluc2lkZSBUVE0gYXMKPiA+Pj4+Pj4gd2VsbC4KPiA+Pj4+Pj4KPiA+Pj4+Pj4g
QWRkaXRpb25hbCB0byB0aGF0IHdoaWNoIGRyaXZlciBpcyBnb2luZyB0byB1c2UgdGhpcz8KPiA+
Pj4+PiBBcyBEYW5pZWwgbWVudGlvbmVkLCBpdCdzIGluIHBhdGNoIDMuIFRoZSBUVE0tYmFzZWQg
ZHJpdmVycyB3aWxsCj4gPj4+Pj4gcmV0cmlldmUgdGhlIHBvaW50ZXIgdmlhIHRoaXMgZnVuY3Rp
b24uCj4gPj4+Pj4KPiA+Pj4+PiBJIGRvIHdhbnQgdG8gc2VlIGFsbCB0aGF0IGJlaW5nIG1vcmUg
dGlnaHRseSBpbnRlZ3JhdGVkIGludG8gVFRNLCBidXQKPiA+Pj4+PiBub3QgaW4gdGhpcyBzZXJp
ZXMuIFRoaXMgb25lIGlzIGFib3V0IGZpeGluZyB0aGUgYm9jaHMtb24tc3BhcmM2NAo+ID4+Pj4+
IHByb2JsZW0gZm9yIGdvb2QuIFBhdGNoIDcgYWRkcyBhbiB1cGRhdGUgdG8gVFRNIHRvIHRoZSBE
Uk0gVE9ETyBsaXN0Lgo+ID4+Pj4gSSBzaG91bGQgaGF2ZSBhc2tlZCB3aGljaCBkcml2ZXIgeW91
IHRyeSB0byBmaXggaGVyZSA6KQo+ID4+Pj4KPiA+Pj4+IEluIHRoaXMgY2FzZSBqdXN0IGtlZXAg
dGhlIGZ1bmN0aW9uIGluc2lkZSBib2NocyBhbmQgb25seSBmaXggaXQgdGhlcmUuCj4gPj4+Pgo+
ID4+Pj4gQWxsIG90aGVyIGRyaXZlcnMgY2FuIGJlIGZpeGVkIHdoZW4gd2UgZ2VuZXJhbGx5IHB1
bXAgdGhpcyB0aHJvdWdoIFRUTS4KPiA+Pj4gRGlkIHlvdSB0YWtlIGEgbG9vayBhdCBwYXRjaCAz
PyBUaGlzIGZ1bmN0aW9uIHdpbGwgYmUgdXNlZCBieSBWUkFNCj4gPj4+IGhlbHBlcnMsIG5vdXZl
YXUsIHJhZGVvbiwgYW1kZ3B1IGFuZCBxeGwuIElmIHdlIGRvbid0IHB1dCBpdCBoZXJlLCB3ZQo+
ID4+PiBoYXZlIHRvIGR1cGxpY2F0ZSB0aGUgZnVuY3Rpb25hbGl0eSBpbiBlYWNoIGlmIHRoZXNl
IGRyaXZlcnMuIEJvY2hzCj4gPj4+IGl0c2VsZiB1c2VzIFZSQU0gaGVscGVycyBhbmQgZG9lc24n
dCB0b3VjaCB0aGUgZnVuY3Rpb24gZGlyZWN0bHkuCj4gPj4gQWgsIG9rIGNhbiB3ZSBoYXZlIHRo
YXQgdGhlbiBvbmx5IGluIHRoZSBWUkFNIGhlbHBlcnM/Cj4gPj4KPiA+PiBBbHRlcm5hdGl2ZSB5
b3UgY291bGQgZ28gYWhlYWQgYW5kIHVzZSBkbWFfYnVmX21hcCBpbiB0dG1fYm9fa21hcF9vYmoK
PiA+PiBkaXJlY3RseSBhbmQgZHJvcCB0aGUgaGFjayB3aXRoIHRoZSBUVE1fQk9fTUFQX0lPTUVN
X01BU0suCj4gPj4KPiA+PiBXaGF0IEkgd2FudCB0byBhdm9pZCBpcyB0byBoYXZlIGFub3RoZXIg
Y29udmVyc2lvbiBmdW5jdGlvbiBpbiBUVE0gYmVjYXVzZQo+ID4+IHdoYXQgaGFwcGVucyBoZXJl
IGlzIHRoYXQgd2UgYWxyZWFkeSBjb252ZXJ0IGZyb20gdHRtX2J1c19wbGFjZW1lbnQgdG8KPiA+
PiB0dG1fYm9fa21hcF9vYmogYW5kIHRoZW4gdG8gZG1hX2J1Zl9tYXAuCj4gPiBIbSBJJ20gbm90
IHJlYWxseSBzZWVpbmcgaG93IHRoYXQgaGVscHMgd2l0aCBhIGdyYWR1YWwgY29udmVyc2lvbiBv
Zgo+ID4gZXZlcnl0aGluZyBvdmVyIHRvIGRtYV9idWZfbWFwIGFuZCBhc3NvcnRlZCBoZWxwZXJz
IGZvciBhY2Nlc3M/IFRoZXJlJ3MKPiA+IHRvbyBtYW55IHBsYWNlcyBpbiB0dG0gZHJpdmVycyB3
aGVyZSBpc19pb21lbSBhbmQgcmVsYXRlZCBzdHVmZiBpcyB1c2VkIHRvCj4gPiBiZSBhYmxlIHRv
IGNvbnZlcnQgaXQgYWxsIGluIG9uZSBnby4gQW4gaW50ZXJtZWRpYXRlIHN0YXRlIHdpdGggYSBi
dW5jaCBvZgo+ID4gY29udmVyc2lvbnMgc2VlbXMgZmFpcmx5IHVuYXZvaWRhYmxlIHRvIG1lLgo+
Cj4gRmFpciBlbm91Z2guIEkgd291bGQganVzdCBoYXZlIHN0YXJ0ZWQgYm90dG9tIHVwIGFuZCBu
b3QgdG9wIGRvd24uCj4KPiBBbnl3YXkgZmVlbCBmcmVlIHRvIGdvIGFoZWFkIHdpdGggdGhpcyBh
cHByb2FjaCBhcyBsb25nIGFzIHdlIGNhbiByZW1vdmUKPiB0aGUgbmV3IGZ1bmN0aW9uIGFnYWlu
IHdoZW4gd2UgY2xlYW4gdGhhdCBzdHVmZiB1cCBmb3IgZ29vZC4KClllYWggSSBndWVzcyBib3R0
b20gdXAgd291bGQgbWFrZSBtb3JlIHNlbnNlIGFzIGEgcmVmYWN0b3JpbmcuIEJ1dCB0aGUKbWFp
biBtb3RpdmF0aW9uIHRvIGxhbmQgdGhpcyBoZXJlIGlzIHRvIGZpeCB0aGUgX19tbWlvIHZzIG5v
cm1hbAptZW1vcnkgY29uZnVzaW9uIGluIHRoZSBmYmRldiBlbXVsYXRpb24gaGVscGVycyBmb3Ig
c3BhcmMgKGFuZAphbnl0aGluZyBlbHNlIHRoYXQgbmVlZHMgdGhpcykuIEhlbmNlIHRoZSB0b3Ag
ZG93biBhcHByb2FjaCBmb3IKcm9sbGluZyB0aGlzIG91dC4KLURhbmllbAoKPgo+IENocmlzdGlh
bi4KPgo+ID4gLURhbmllbAo+ID4KPiA+PiBUaGFua3MsCj4gPj4gQ2hyaXN0aWFuLgo+ID4+Cj4g
Pj4+IEJlc3QgcmVnYXJkcwo+ID4+PiBUaG9tYXMKPiA+Pj4KPiA+Pj4+IFJlZ2FyZHMsCj4gPj4+
PiBDaHJpc3RpYW4uCj4gPj4+Pgo+ID4+Pj4+IEJlc3QgcmVnYXJkcwo+ID4+Pj4+IFRob21hcwo+
ID4+Pj4+Cj4gPj4+Pj4+IFJlZ2FyZHMsCj4gPj4+Pj4+IENocmlzdGlhbi4KPiA+Pj4+Pj4KPiA+
Pj4+Pj4+IFNpZ25lZC1vZmYtYnk6IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNl
LmRlPgo+ID4+Pj4+Pj4gLS0tCj4gPj4+Pj4+PiAgICAgaW5jbHVkZS9kcm0vdHRtL3R0bV9ib19h
cGkuaCB8IDI0ICsrKysrKysrKysrKysrKysrKysrKysrKwo+ID4+Pj4+Pj4gICAgIGluY2x1ZGUv
bGludXgvZG1hLWJ1Zi1tYXAuaCAgfCAyMCArKysrKysrKysrKysrKysrKysrKwo+ID4+Pj4+Pj4g
ICAgIDIgZmlsZXMgY2hhbmdlZCwgNDQgaW5zZXJ0aW9ucygrKQo+ID4+Pj4+Pj4KPiA+Pj4+Pj4+
IGRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS90dG0vdHRtX2JvX2FwaS5oIGIvaW5jbHVkZS9kcm0v
dHRtL3R0bV9ib19hcGkuaAo+ID4+Pj4+Pj4gaW5kZXggYzk2YTI1ZDU3MWM4Li42MmQ4OWYwNWE4
MDEgMTAwNjQ0Cj4gPj4+Pj4+PiAtLS0gYS9pbmNsdWRlL2RybS90dG0vdHRtX2JvX2FwaS5oCj4g
Pj4+Pj4+PiArKysgYi9pbmNsdWRlL2RybS90dG0vdHRtX2JvX2FwaS5oCj4gPj4+Pj4+PiBAQCAt
MzQsNiArMzQsNyBAQAo+ID4+Pj4+Pj4gICAgICNpbmNsdWRlIDxkcm0vZHJtX2dlbS5oPgo+ID4+
Pj4+Pj4gICAgICNpbmNsdWRlIDxkcm0vZHJtX2hhc2h0YWIuaD4KPiA+Pj4+Pj4+ICAgICAjaW5j
bHVkZSA8ZHJtL2RybV92bWFfbWFuYWdlci5oPgo+ID4+Pj4+Pj4gKyNpbmNsdWRlIDxsaW51eC9k
bWEtYnVmLW1hcC5oPgo+ID4+Pj4+Pj4gICAgICNpbmNsdWRlIDxsaW51eC9rcmVmLmg+Cj4gPj4+
Pj4+PiAgICAgI2luY2x1ZGUgPGxpbnV4L2xpc3QuaD4KPiA+Pj4+Pj4+ICAgICAjaW5jbHVkZSA8
bGludXgvd2FpdC5oPgo+ID4+Pj4+Pj4gQEAgLTQ4Niw2ICs0ODcsMjkgQEAgc3RhdGljIGlubGlu
ZSB2b2lkICp0dG1fa21hcF9vYmpfdmlydHVhbChzdHJ1Y3QKPiA+Pj4+Pj4+IHR0bV9ib19rbWFw
X29iaiAqbWFwLAo+ID4+Pj4+Pj4gICAgICAgICByZXR1cm4gbWFwLT52aXJ0dWFsOwo+ID4+Pj4+
Pj4gICAgIH0KPiA+Pj4+Pj4+ICAgICArLyoqCj4gPj4+Pj4+PiArICogdHRtX2ttYXBfb2JqX3Rv
X2RtYV9idWZfbWFwCj4gPj4+Pj4+PiArICoKPiA+Pj4+Pj4+ICsgKiBAa21hcDogQSBzdHJ1Y3Qg
dHRtX2JvX2ttYXBfb2JqIHJldHVybmVkIGZyb20gdHRtX2JvX2ttYXAuCj4gPj4+Pj4+PiArICog
QG1hcDogUmV0dXJucyB0aGUgbWFwcGluZyBhcyBzdHJ1Y3QgZG1hX2J1Zl9tYXAKPiA+Pj4+Pj4+
ICsgKgo+ID4+Pj4+Pj4gKyAqIENvbnZlcnRzIHN0cnVjdCB0dG1fYm9fa21hcF9vYmogdG8gc3Ry
dWN0IGRtYV9idWZfbWFwLiBJZiB0aGUgbWVtb3J5Cj4gPj4+Pj4+PiArICogaXMgbm90IG1hcHBl
ZCwgdGhlIHJldHVybmVkIG1hcHBpbmcgaXMgaW5pdGlhbGl6ZWQgdG8gTlVMTC4KPiA+Pj4+Pj4+
ICsgKi8KPiA+Pj4+Pj4+ICtzdGF0aWMgaW5saW5lIHZvaWQgdHRtX2ttYXBfb2JqX3RvX2RtYV9i
dWZfbWFwKHN0cnVjdCB0dG1fYm9fa21hcF9vYmoKPiA+Pj4+Pj4+ICprbWFwLAo+ID4+Pj4+Pj4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBkbWFfYnVmX21hcCAqbWFwKQo+ID4+
Pj4+Pj4gK3sKPiA+Pj4+Pj4+ICsgICAgYm9vbCBpc19pb21lbTsKPiA+Pj4+Pj4+ICsgICAgdm9p
ZCAqdmFkZHIgPSB0dG1fa21hcF9vYmpfdmlydHVhbChrbWFwLCAmaXNfaW9tZW0pOwo+ID4+Pj4+
Pj4gKwo+ID4+Pj4+Pj4gKyAgICBpZiAoIXZhZGRyKQo+ID4+Pj4+Pj4gKyAgICAgICAgZG1hX2J1
Zl9tYXBfY2xlYXIobWFwKTsKPiA+Pj4+Pj4+ICsgICAgZWxzZSBpZiAoaXNfaW9tZW0pCj4gPj4+
Pj4+PiArICAgICAgICBkbWFfYnVmX21hcF9zZXRfdmFkZHJfaW9tZW0obWFwLCAodm9pZCBfX2Zv
cmNlIF9faW9tZW0gKil2YWRkcik7Cj4gPj4+Pj4+PiArICAgIGVsc2UKPiA+Pj4+Pj4+ICsgICAg
ICAgIGRtYV9idWZfbWFwX3NldF92YWRkcihtYXAsIHZhZGRyKTsKPiA+Pj4+Pj4+ICt9Cj4gPj4+
Pj4+PiArCj4gPj4+Pj4+PiAgICAgLyoqCj4gPj4+Pj4+PiAgICAgICogdHRtX2JvX2ttYXAKPiA+
Pj4+Pj4+ICAgICAgKgo+ID4+Pj4+Pj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvZG1hLWJ1
Zi1tYXAuaCBiL2luY2x1ZGUvbGludXgvZG1hLWJ1Zi1tYXAuaAo+ID4+Pj4+Pj4gaW5kZXggZmQx
YWJhNTQ1ZmRmLi4yZThiYmVjYjUwOTEgMTAwNjQ0Cj4gPj4+Pj4+PiAtLS0gYS9pbmNsdWRlL2xp
bnV4L2RtYS1idWYtbWFwLmgKPiA+Pj4+Pj4+ICsrKyBiL2luY2x1ZGUvbGludXgvZG1hLWJ1Zi1t
YXAuaAo+ID4+Pj4+Pj4gQEAgLTQ1LDYgKzQ1LDEyIEBACj4gPj4+Pj4+PiAgICAgICoKPiA+Pj4+
Pj4+ICAgICAgKiAgICBkbWFfYnVmX21hcF9zZXRfdmFkZHIoJm1hcC4gMHhkZWFkYmVhZik7Cj4g
Pj4+Pj4+PiAgICAgICoKPiA+Pj4+Pj4+ICsgKiBUbyBzZXQgYW4gYWRkcmVzcyBpbiBJL08gbWVt
b3J5LCB1c2UgZG1hX2J1Zl9tYXBfc2V0X3ZhZGRyX2lvbWVtKCkuCj4gPj4+Pj4+PiArICoKPiA+
Pj4+Pj4+ICsgKiAuLiBjb2RlLWJsb2NrOjogYwo+ID4+Pj4+Pj4gKyAqCj4gPj4+Pj4+PiArICog
ICAgZG1hX2J1Zl9tYXBfc2V0X3ZhZGRyX2lvbWVtKCZtYXAuIDB4ZGVhZGJlYWYpOwo+ID4+Pj4+
Pj4gKyAqCj4gPj4+Pj4+PiAgICAgICogVGVzdCBpZiBhIG1hcHBpbmcgaXMgdmFsaWQgd2l0aCBl
aXRoZXIgZG1hX2J1Zl9tYXBfaXNfc2V0KCkgb3IKPiA+Pj4+Pj4+ICAgICAgKiBkbWFfYnVmX21h
cF9pc19udWxsKCkuCj4gPj4+Pj4+PiAgICAgICoKPiA+Pj4+Pj4+IEBAIC0xMTgsNiArMTI0LDIw
IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBkbWFfYnVmX21hcF9zZXRfdmFkZHIoc3RydWN0Cj4gPj4+
Pj4+PiBkbWFfYnVmX21hcCAqbWFwLCB2b2lkICp2YWRkcikKPiA+Pj4+Pj4+ICAgICAgICAgbWFw
LT5pc19pb21lbSA9IGZhbHNlOwo+ID4+Pj4+Pj4gICAgIH0KPiA+Pj4+Pj4+ICAgICArLyoqCj4g
Pj4+Pj4+PiArICogZG1hX2J1Zl9tYXBfc2V0X3ZhZGRyX2lvbWVtIC0gU2V0cyBhIGRtYS1idWYg
bWFwcGluZyBzdHJ1Y3R1cmUgdG8KPiA+Pj4+Pj4+IGFuIGFkZHJlc3MgaW4gSS9PIG1lbW9yeQo+
ID4+Pj4+Pj4gKyAqIEBtYXA6ICAgICAgICBUaGUgZG1hLWJ1ZiBtYXBwaW5nIHN0cnVjdHVyZQo+
ID4+Pj4+Pj4gKyAqIEB2YWRkcl9pb21lbTogICAgQW4gSS9PLW1lbW9yeSBhZGRyZXNzCj4gPj4+
Pj4+PiArICoKPiA+Pj4+Pj4+ICsgKiBTZXRzIHRoZSBhZGRyZXNzIGFuZCB0aGUgSS9PLW1lbW9y
eSBmbGFnLgo+ID4+Pj4+Pj4gKyAqLwo+ID4+Pj4+Pj4gK3N0YXRpYyBpbmxpbmUgdm9pZCBkbWFf
YnVmX21hcF9zZXRfdmFkZHJfaW9tZW0oc3RydWN0IGRtYV9idWZfbWFwICptYXAsCj4gPj4+Pj4+
PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgdm9pZCBfX2lvbWVtICp2YWRkcl9pb21lbSkK
PiA+Pj4+Pj4+ICt7Cj4gPj4+Pj4+PiArICAgIG1hcC0+dmFkZHJfaW9tZW0gPSB2YWRkcl9pb21l
bTsKPiA+Pj4+Pj4+ICsgICAgbWFwLT5pc19pb21lbSA9IHRydWU7Cj4gPj4+Pj4+PiArfQo+ID4+
Pj4+Pj4gKwo+ID4+Pj4+Pj4gICAgIC8qKgo+ID4+Pj4+Pj4gICAgICAqIGRtYV9idWZfbWFwX2lz
X2VxdWFsIC0gQ29tcGFyZXMgdHdvIGRtYS1idWYgbWFwcGluZyBzdHJ1Y3R1cmVzCj4gPj4+Pj4+
PiBmb3IgZXF1YWxpdHkKPiA+Pj4+Pj4+ICAgICAgKiBAbGhzOiAgICBUaGUgZG1hLWJ1ZiBtYXBw
aW5nIHN0cnVjdHVyZQo+ID4+Pj4+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwo+ID4+Pj4+PiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gPj4+Pj4+IGRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiA+Pj4+Pj4gaHR0cHM6Ly9uYW0xMS5zYWZl
bGlua3MucHJvdGVjdGlvbi5vdXRsb29rLmNvbS8/dXJsPWh0dHBzJTNBJTJGJTJGbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnJTJGbWFpbG1hbiUyRmxpc3RpbmZvJTJGZHJpLWRldmVsJmFtcDtkYXRhPTAy
JTdDMDElN0NjaHJpc3RpYW4ua29lbmlnJTQwYW1kLmNvbSU3QzQ3MmMzZDY1NWE2MTQxMWRlYjY3
MDhkODY1MjVkMWI4JTdDM2RkODk2MWZlNDg4NGU2MDhlMTFhODJkOTk0ZTE4M2QlN0MwJTdDMCU3
QzYzNzM3MDU2MDQzODk2NTAxMyZhbXA7c2RhdGE9SGRIT0ElMkYxVmNJWCUyRjdZdGZZVGlBcVlF
dnc3QWclMkZTJTJCeFM1VndKS092NXkwJTNEJmFtcDtyZXNlcnZlZD0wCj4gPj4+Pj4gX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiA+Pj4+PiBhbWQtZ2Z4
IG1haWxpbmcgbGlzdAo+ID4+Pj4+IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gPj4+
Pj4gaHR0cHM6Ly9uYW0xMS5zYWZlbGlua3MucHJvdGVjdGlvbi5vdXRsb29rLmNvbS8/dXJsPWh0
dHBzJTNBJTJGJTJGbGlzdHMuZnJlZWRlc2t0b3Aub3JnJTJGbWFpbG1hbiUyRmxpc3RpbmZvJTJG
YW1kLWdmeCZhbXA7ZGF0YT0wMiU3QzAxJTdDY2hyaXN0aWFuLmtvZW5pZyU0MGFtZC5jb20lN0M0
NzJjM2Q2NTVhNjE0MTFkZWI2NzA4ZDg2NTI1ZDFiOCU3QzNkZDg5NjFmZTQ4ODRlNjA4ZTExYTgy
ZDk5NGUxODNkJTdDMCU3QzAlN0M2MzczNzA1NjA0Mzg5NjUwMTMmYW1wO3NkYXRhPUglMkI1SEtD
c1Rya3NSVjJFeUVpRkdTVHlTNzlqc1dDbUppbVNNb0pZdXN4OCUzRCZhbXA7cmVzZXJ2ZWQ9MAo+
ID4+Pj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiA+
Pj4+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKPiA+Pj4+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKPiA+Pj4+IGh0dHBzOi8vbmFtMTEuc2FmZWxpbmtzLnByb3RlY3Rpb24ub3V0bG9v
ay5jb20vP3VybD1odHRwcyUzQSUyRiUyRmxpc3RzLmZyZWVkZXNrdG9wLm9yZyUyRm1haWxtYW4l
MkZsaXN0aW5mbyUyRmRyaS1kZXZlbCZhbXA7ZGF0YT0wMiU3QzAxJTdDY2hyaXN0aWFuLmtvZW5p
ZyU0MGFtZC5jb20lN0M0NzJjM2Q2NTVhNjE0MTFkZWI2NzA4ZDg2NTI1ZDFiOCU3QzNkZDg5NjFm
ZTQ4ODRlNjA4ZTExYTgyZDk5NGUxODNkJTdDMCU3QzAlN0M2MzczNzA1NjA0Mzg5NjUwMTMmYW1w
O3NkYXRhPUhkSE9BJTJGMVZjSVglMkY3WXRmWVRpQXFZRXZ3N0FnJTJGUyUyQnhTNVZ3SktPdjV5
MCUzRCZhbXA7cmVzZXJ2ZWQ9MAo+ID4+Pj4KPiA+Pj4gX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KPiA+Pj4gYW1kLWdmeCBtYWlsaW5nIGxpc3QKPiA+Pj4g
YW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiA+Pj4gaHR0cHM6Ly9uYW0xMS5zYWZlbGlu
a3MucHJvdGVjdGlvbi5vdXRsb29rLmNvbS8/dXJsPWh0dHBzJTNBJTJGJTJGbGlzdHMuZnJlZWRl
c2t0b3Aub3JnJTJGbWFpbG1hbiUyRmxpc3RpbmZvJTJGYW1kLWdmeCZhbXA7ZGF0YT0wMiU3QzAx
JTdDY2hyaXN0aWFuLmtvZW5pZyU0MGFtZC5jb20lN0M0NzJjM2Q2NTVhNjE0MTFkZWI2NzA4ZDg2
NTI1ZDFiOCU3QzNkZDg5NjFmZTQ4ODRlNjA4ZTExYTgyZDk5NGUxODNkJTdDMCU3QzAlN0M2Mzcz
NzA1NjA0Mzg5NjUwMTMmYW1wO3NkYXRhPUglMkI1SEtDc1Rya3NSVjJFeUVpRkdTVHlTNzlqc1dD
bUppbVNNb0pZdXN4OCUzRCZhbXA7cmVzZXJ2ZWQ9MAo+CgoKLS0gCkRhbmllbCBWZXR0ZXIKU29m
dHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uCmh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFp
bGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeAo=
