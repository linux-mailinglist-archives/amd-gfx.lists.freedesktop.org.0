Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80EB35D7A8
	for <lists+amd-gfx@lfdr.de>; Tue,  2 Jul 2019 22:56:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 847546E090;
	Tue,  2 Jul 2019 20:56:33 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27BAA6E090;
 Tue,  2 Jul 2019 20:56:32 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id g135so2158780wme.4;
 Tue, 02 Jul 2019 13:56:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7apIY6kDGFnuoJ9ubIfX+qcJQe/s6+Dz11ttp8LxM4s=;
 b=FRehjT2fvSJRIJkKvC5F0eSopOCK8JNwQcMkYoxOWhs6JCNWCnVP0Ec69kHd1pLRpq
 xw1rrX2Q52iSljHdreb6ks7s5/SuMgYBGfvTnrv0GMya06+r4VM/jusPH6q9HD8vrxHW
 P+lLWQwIQpylvOGAtjg5z8ReEPRUmA7qLc7kPeSVeUIZirznjwLIlVCfE4N1lkO6uQQw
 6/hFGpid9H8nLXVH9rSRn3E2T6uwj7RXYajSTIeD886YXWUQ8O377N32GVNgET6tFrph
 0bUpKnymUNnkGPIb/po7l4EgN2DfrG3WQZ8ntWt8ap6K4eM3S0RmdO/xpHPCCIicSIx1
 95tQ==
X-Gm-Message-State: APjAAAXeoOci0JLv1vhOiBPliWMqJ+LFZntxg2cyjXUdnkVWor0iKz8m
 yAKQPOVkKjkn4MOe1LSlhyEmHvTZct89hL38Yc0=
X-Google-Smtp-Source: APXvYqzkQ2pl6k17yCfQLTYXSGvxNe+W/nXewr5/FwNT86ujpJn50HOvb8f6DrLB5AFhlFr0aYNAoFhRctxvV3eHJhs=
X-Received: by 2002:a1c:67c3:: with SMTP id b186mr4329031wmc.34.1562100990683; 
 Tue, 02 Jul 2019 13:56:30 -0700 (PDT)
MIME-Version: 1.0
References: <3fb19371-db7d-f9dc-31a7-1ccd126f6784@collabora.com>
 <cover.1561735433.git.andrzej.p@collabora.com>
 <dd1312ee84adef0161ebeaaf3c0448b1a1371919.1561735433.git.andrzej.p@collabora.com>
In-Reply-To: <dd1312ee84adef0161ebeaaf3c0448b1a1371919.1561735433.git.andrzej.p@collabora.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 2 Jul 2019 16:56:19 -0400
Message-ID: <CADnq5_NVVUkuiQrCtsbFLzGFGAdwAD7Rbx5SJFXGQvEB9kv6rA@mail.gmail.com>
Subject: Re: [PATCH v3 22/22] drm/radeon: Provide ddc symlink in connector
 sysfs directory
To: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=7apIY6kDGFnuoJ9ubIfX+qcJQe/s6+Dz11ttp8LxM4s=;
 b=d9xvjIlGMlQPy8M9kynWnJKkrXwoJxEkz338kjUpBah29lD2tns9sCyvdUuGlOOiV2
 HA1TJfTCDYnGWe1njE/2VwSeQDQd99rHMWzdStrv/sTYMMUXgEhuy27wiajTqAJhHqIe
 1LGwi5qfaCIfA+qZwrY9F3ln0FjVdCT4/jUzxfM8efNH73KuqPAxIsFgRP9bpPlsDzci
 C9Llo4AfOBCe1x+CPOMoSBJ8KNHRMdmY7PffSiJnEZGFupto/1efsCUOWoZc5ZPwStxF
 xBE8+4SMbiPG8DSJ9yB8BFYAchS+jrLEVpKbyYHDUt6IHDFvsix7IlQz/DqNinl1HPJK
 Zzkg==
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
Cc: "Y.C. Chen" <yc_chen@aspeedtech.com>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Sandy Huang <hjc@rock-chips.com>, Andrzej Hajda <a.hajda@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Shawn Guo <shawnguo@kernel.org>, kernel@collabora.com,
 Fabio Estevam <festevam@gmail.com>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 "David \(ChunMing\) Zhou" <David1.Zhou@amd.com>,
 linux-samsung-soc@vger.kernel.org, Joonyoung Shim <jy0922.shim@samsung.com>,
 Sam Ravnborg <sam@ravnborg.org>, Kyungmin Park <kyungmin.park@samsung.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
 linux-rockchip@lists.infradead.org, Chen-Yu Tsai <wens@csie.org>,
 Kukjin Kim <kgene@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 NXP Linux Team <linux-imx@nxp.com>, CK Hu <ck.hu@mediatek.com>,
 Dave Airlie <airlied@redhat.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Philipp Zabel <p.zabel@pengutronix.de>, Daniel Vetter <daniel@ffwll.ch>,
 Jonas Karlman <jonas@kwiboo.se>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Jyri Sarha <jsarha@ti.com>, Inki Dae <inki.dae@samsung.com>,
 Mamta Shukla <mamtashukla555@gmail.com>, linux-mediatek@lists.infradead.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, linux-tegra@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, Vincent Abriou <vincent.abriou@st.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Sean Paul <sean@poorly.run>, amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Eric Anholt <eric@anholt.net>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Douglas Anderson <dianders@chromium.org>, LKML <linux-kernel@vger.kernel.org>,
 Todor Tomov <todor.tomov@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Huang Rui <ray.huang@amd.com>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Alex Deucher <alexander.deucher@amd.com>,
 freedreno <freedreno@lists.freedesktop.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gRnJpLCBKdW4gMjgsIDIwMTkgYXQgMTI6MzEgUE0gQW5kcnplaiBQaWV0cmFzaWV3aWN6Cjxh
bmRyemVqLnBAY29sbGFib3JhLmNvbT4gd3JvdGU6Cj4KPiBVc2UgdGhlIGRkYyBwb2ludGVyIHBy
b3ZpZGVkIGJ5IHRoZSBnZW5lcmljIGNvbm5lY3Rvci4KPgo+IFNpZ25lZC1vZmYtYnk6IEFuZHJ6
ZWogUGlldHJhc2lld2ljeiA8YW5kcnplai5wQGNvbGxhYm9yYS5jb20+Cj4gLS0tCj4gIGRyaXZl
cnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2Nvbm5lY3RvcnMuYyB8IDgyICsrKysrKysrKysrKysr
KysrLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDYzIGluc2VydGlvbnMoKyksIDE5IGRlbGV0aW9u
cygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2Nvbm5l
Y3RvcnMuYyBiL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2Nvbm5lY3RvcnMuYwo+IGlu
ZGV4IGM2MGQxYTQ0ZDIyYS4uYTg3NmU1MWQyNzVhIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9yYWRlb24vcmFkZW9uX2Nvbm5lY3RvcnMuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9y
YWRlb24vcmFkZW9uX2Nvbm5lY3RvcnMuYwo+IEBAIC0xOTQ2LDExICsxOTQ2LDE1IEBAIHJhZGVv
bl9hZGRfYXRvbV9jb25uZWN0b3Ioc3RydWN0IGRybV9kZXZpY2UgKmRldiwKPiAgICAgICAgICAg
ICAgICAgcmFkZW9uX2RpZ19jb25uZWN0b3ItPmlncF9sYW5lX2luZm8gPSBpZ3BfbGFuZV9pbmZv
Owo+ICAgICAgICAgICAgICAgICByYWRlb25fY29ubmVjdG9yLT5jb25fcHJpdiA9IHJhZGVvbl9k
aWdfY29ubmVjdG9yOwo+ICAgICAgICAgICAgICAgICBpZiAoaTJjX2J1cy0+dmFsaWQpIHsKPiAt
ICAgICAgICAgICAgICAgICAgICAgICByYWRlb25fY29ubmVjdG9yLT5kZGNfYnVzID0gcmFkZW9u
X2kyY19sb29rdXAocmRldiwgaTJjX2J1cyk7Cj4gLSAgICAgICAgICAgICAgICAgICAgICAgaWYg
KHJhZGVvbl9jb25uZWN0b3ItPmRkY19idXMpCj4gKyAgICAgICAgICAgICAgICAgICAgICAgc3Ry
dWN0IHJhZGVvbl9jb25uZWN0b3IgKnJjbiA9IHJhZGVvbl9jb25uZWN0b3I7Cj4gKwo+ICsgICAg
ICAgICAgICAgICAgICAgICAgIHJjbi0+ZGRjX2J1cyA9IHJhZGVvbl9pMmNfbG9va3VwKHJkZXYs
IGkyY19idXMpOwo+ICsgICAgICAgICAgICAgICAgICAgICAgIGlmIChyY24tPmRkY19idXMpIHsK
ClNhbWUgY29tbWVudCBhcyB0aGUgYW1kZ3B1IHBhdGNoLiAgSSB0aGluayB5b3UgY2FuIGRyb3Ag
dGhpcyBodW5rLiAgSW4KZmFjdCwgeW91IGRvIGluIHNvbWUgb2YgdGhlIG90aGVyIGNvZGUgcGF0
aHMgYmVsb3cuICBTYW1lIGNvbW1lbnQgb24KdGhlIG90aGVyIHBhdGhzIGJlbG93LgoKQWxleAoK
PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGhhc19hdXggPSB0cnVlOwo+IC0gICAg
ICAgICAgICAgICAgICAgICAgIGVsc2UKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IGNvbm5lY3Rvci0+ZGRjID0gJnJjbi0+ZGRjX2J1cy0+YWRhcHRlcjsKPiArICAgICAgICAgICAg
ICAgICAgICAgICB9IGVsc2Ugewo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgRFJN
X0VSUk9SKCJEUDogRmFpbGVkIHRvIGFzc2lnbiBkZGMgYnVzISBDaGVjayBkbWVzZyBmb3IgaTJj
IGVycm9ycy5cbiIpOwo+ICsgICAgICAgICAgICAgICAgICAgICAgIH0KPiAgICAgICAgICAgICAg
ICAgfQo+ICAgICAgICAgICAgICAgICBzd2l0Y2ggKGNvbm5lY3Rvcl90eXBlKSB7Cj4gICAgICAg
ICAgICAgICAgIGNhc2UgRFJNX01PREVfQ09OTkVDVE9SX1ZHQToKPiBAQCAtMjA0NSw5ICsyMDQ5
LDEzIEBAIHJhZGVvbl9hZGRfYXRvbV9jb25uZWN0b3Ioc3RydWN0IGRybV9kZXZpY2UgKmRldiwK
PiAgICAgICAgICAgICAgICAgICAgICAgICBkcm1fY29ubmVjdG9yX2luaXQoZGV2LCAmcmFkZW9u
X2Nvbm5lY3Rvci0+YmFzZSwgJnJhZGVvbl92Z2FfY29ubmVjdG9yX2Z1bmNzLCBjb25uZWN0b3Jf
dHlwZSk7Cj4gICAgICAgICAgICAgICAgICAgICAgICAgZHJtX2Nvbm5lY3Rvcl9oZWxwZXJfYWRk
KCZyYWRlb25fY29ubmVjdG9yLT5iYXNlLCAmcmFkZW9uX3ZnYV9jb25uZWN0b3JfaGVscGVyX2Z1
bmNzKTsKPiAgICAgICAgICAgICAgICAgICAgICAgICBpZiAoaTJjX2J1cy0+dmFsaWQpIHsKPiAt
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJhZGVvbl9jb25uZWN0b3ItPmRkY19idXMg
PSByYWRlb25faTJjX2xvb2t1cChyZGV2LCBpMmNfYnVzKTsKPiAtICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIGlmICghcmFkZW9uX2Nvbm5lY3Rvci0+ZGRjX2J1cykKPiArICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCByYWRlb25fY29ubmVjdG9yICpyY24gPSByYWRl
b25fY29ubmVjdG9yOwo+ICsKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJjbi0+
ZGRjX2J1cyA9IHJhZGVvbl9pMmNfbG9va3VwKHJkZXYsIGkyY19idXMpOwo+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgaWYgKCFyY24tPmRkY19idXMpCj4gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIERSTV9FUlJPUigiVkdBOiBGYWlsZWQgdG8gYXNzaWdu
IGRkYyBidXMhIENoZWNrIGRtZXNnIGZvciBpMmMgZXJyb3JzLlxuIik7Cj4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBlbHNlCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIGNvbm5lY3Rvci0+ZGRjID0gJnJjbi0+ZGRjX2J1cy0+YWRhcHRlcjsKPiAgICAg
ICAgICAgICAgICAgICAgICAgICB9Cj4gICAgICAgICAgICAgICAgICAgICAgICAgcmFkZW9uX2Nv
bm5lY3Rvci0+ZGFjX2xvYWRfZGV0ZWN0ID0gdHJ1ZTsKPiAgICAgICAgICAgICAgICAgICAgICAg
ICBkcm1fb2JqZWN0X2F0dGFjaF9wcm9wZXJ0eSgmcmFkZW9uX2Nvbm5lY3Rvci0+YmFzZS5iYXNl
LAo+IEBAIC0yMDcwLDkgKzIwNzgsMTMgQEAgcmFkZW9uX2FkZF9hdG9tX2Nvbm5lY3RvcihzdHJ1
Y3QgZHJtX2RldmljZSAqZGV2LAo+ICAgICAgICAgICAgICAgICAgICAgICAgIGRybV9jb25uZWN0
b3JfaW5pdChkZXYsICZyYWRlb25fY29ubmVjdG9yLT5iYXNlLCAmcmFkZW9uX3ZnYV9jb25uZWN0
b3JfZnVuY3MsIGNvbm5lY3Rvcl90eXBlKTsKPiAgICAgICAgICAgICAgICAgICAgICAgICBkcm1f
Y29ubmVjdG9yX2hlbHBlcl9hZGQoJnJhZGVvbl9jb25uZWN0b3ItPmJhc2UsICZyYWRlb25fdmdh
X2Nvbm5lY3Rvcl9oZWxwZXJfZnVuY3MpOwo+ICAgICAgICAgICAgICAgICAgICAgICAgIGlmIChp
MmNfYnVzLT52YWxpZCkgewo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcmFkZW9u
X2Nvbm5lY3Rvci0+ZGRjX2J1cyA9IHJhZGVvbl9pMmNfbG9va3VwKHJkZXYsIGkyY19idXMpOwo+
IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaWYgKCFyYWRlb25fY29ubmVjdG9yLT5k
ZGNfYnVzKQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IHJhZGVvbl9j
b25uZWN0b3IgKnJjbiA9IHJhZGVvbl9jb25uZWN0b3I7Cj4gKwo+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgcmNuLT5kZGNfYnVzID0gcmFkZW9uX2kyY19sb29rdXAocmRldiwgaTJj
X2J1cyk7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBpZiAoIXJjbi0+ZGRjX2J1
cykKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgRFJNX0VSUk9SKCJE
VklBOiBGYWlsZWQgdG8gYXNzaWduIGRkYyBidXMhIENoZWNrIGRtZXNnIGZvciBpMmMgZXJyb3Jz
LlxuIik7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBlbHNlCj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbm5lY3Rvci0+ZGRjID0gJnJjbi0+ZGRj
X2J1cy0+YWRhcHRlcjsKPiAgICAgICAgICAgICAgICAgICAgICAgICB9Cj4gICAgICAgICAgICAg
ICAgICAgICAgICAgcmFkZW9uX2Nvbm5lY3Rvci0+ZGFjX2xvYWRfZGV0ZWN0ID0gdHJ1ZTsKPiAg
ICAgICAgICAgICAgICAgICAgICAgICBkcm1fb2JqZWN0X2F0dGFjaF9wcm9wZXJ0eSgmcmFkZW9u
X2Nvbm5lY3Rvci0+YmFzZS5iYXNlLAo+IEBAIC0yMTAxLDkgKzIxMTMsMTMgQEAgcmFkZW9uX2Fk
ZF9hdG9tX2Nvbm5lY3RvcihzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LAo+ICAgICAgICAgICAgICAg
ICAgICAgICAgIGRybV9jb25uZWN0b3JfaW5pdChkZXYsICZyYWRlb25fY29ubmVjdG9yLT5iYXNl
LCAmcmFkZW9uX2R2aV9jb25uZWN0b3JfZnVuY3MsIGNvbm5lY3Rvcl90eXBlKTsKPiAgICAgICAg
ICAgICAgICAgICAgICAgICBkcm1fY29ubmVjdG9yX2hlbHBlcl9hZGQoJnJhZGVvbl9jb25uZWN0
b3ItPmJhc2UsICZyYWRlb25fZHZpX2Nvbm5lY3Rvcl9oZWxwZXJfZnVuY3MpOwo+ICAgICAgICAg
ICAgICAgICAgICAgICAgIGlmIChpMmNfYnVzLT52YWxpZCkgewo+IC0gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgcmFkZW9uX2Nvbm5lY3Rvci0+ZGRjX2J1cyA9IHJhZGVvbl9pMmNfbG9v
a3VwKHJkZXYsIGkyY19idXMpOwo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaWYg
KCFyYWRlb25fY29ubmVjdG9yLT5kZGNfYnVzKQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgc3RydWN0IHJhZGVvbl9jb25uZWN0b3IgKnJjbiA9IHJhZGVvbl9jb25uZWN0b3I7Cj4g
Kwo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcmNuLT5kZGNfYnVzID0gcmFkZW9u
X2kyY19sb29rdXAocmRldiwgaTJjX2J1cyk7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBpZiAoIXJjbi0+ZGRjX2J1cykKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgRFJNX0VSUk9SKCJEVkk6IEZhaWxlZCB0byBhc3NpZ24gZGRjIGJ1cyEgQ2hlY2sg
ZG1lc2cgZm9yIGkyYyBlcnJvcnMuXG4iKTsKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIGVsc2UKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29ubmVj
dG9yLT5kZGMgPSAmcmNuLT5kZGNfYnVzLT5hZGFwdGVyOwo+ICAgICAgICAgICAgICAgICAgICAg
ICAgIH0KPiAgICAgICAgICAgICAgICAgICAgICAgICBzdWJwaXhlbF9vcmRlciA9IFN1YlBpeGVs
SG9yaXpvbnRhbFJHQjsKPiAgICAgICAgICAgICAgICAgICAgICAgICBkcm1fb2JqZWN0X2F0dGFj
aF9wcm9wZXJ0eSgmcmFkZW9uX2Nvbm5lY3Rvci0+YmFzZS5iYXNlLAo+IEBAIC0yMTU4LDkgKzIx
NzQsMTMgQEAgcmFkZW9uX2FkZF9hdG9tX2Nvbm5lY3RvcihzdHJ1Y3QgZHJtX2RldmljZSAqZGV2
LAo+ICAgICAgICAgICAgICAgICAgICAgICAgIGRybV9jb25uZWN0b3JfaW5pdChkZXYsICZyYWRl
b25fY29ubmVjdG9yLT5iYXNlLCAmcmFkZW9uX2R2aV9jb25uZWN0b3JfZnVuY3MsIGNvbm5lY3Rv
cl90eXBlKTsKPiAgICAgICAgICAgICAgICAgICAgICAgICBkcm1fY29ubmVjdG9yX2hlbHBlcl9h
ZGQoJnJhZGVvbl9jb25uZWN0b3ItPmJhc2UsICZyYWRlb25fZHZpX2Nvbm5lY3Rvcl9oZWxwZXJf
ZnVuY3MpOwo+ICAgICAgICAgICAgICAgICAgICAgICAgIGlmIChpMmNfYnVzLT52YWxpZCkgewo+
IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcmFkZW9uX2Nvbm5lY3Rvci0+ZGRjX2J1
cyA9IHJhZGVvbl9pMmNfbG9va3VwKHJkZXYsIGkyY19idXMpOwo+IC0gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgaWYgKCFyYWRlb25fY29ubmVjdG9yLT5kZGNfYnVzKQo+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IHJhZGVvbl9jb25uZWN0b3IgKnJjbiA9IHJh
ZGVvbl9jb25uZWN0b3I7Cj4gKwo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcmNu
LT5kZGNfYnVzID0gcmFkZW9uX2kyY19sb29rdXAocmRldiwgaTJjX2J1cyk7Cj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBpZiAoIXJjbi0+ZGRjX2J1cykKPiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgRFJNX0VSUk9SKCJIRE1JOiBGYWlsZWQgdG8gYXNz
aWduIGRkYyBidXMhIENoZWNrIGRtZXNnIGZvciBpMmMgZXJyb3JzLlxuIik7Cj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBlbHNlCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIGNvbm5lY3Rvci0+ZGRjID0gJnJjbi0+ZGRjX2J1cy0+YWRhcHRlcjsKPiAg
ICAgICAgICAgICAgICAgICAgICAgICB9Cj4gICAgICAgICAgICAgICAgICAgICAgICAgZHJtX29i
amVjdF9hdHRhY2hfcHJvcGVydHkoJnJhZGVvbl9jb25uZWN0b3ItPmJhc2UuYmFzZSwKPiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICByZGV2LT5t
b2RlX2luZm8uY29oZXJlbnRfbW9kZV9wcm9wZXJ0eSwKPiBAQCAtMjIwOCwxMSArMjIyOCwxNSBA
QCByYWRlb25fYWRkX2F0b21fY29ubmVjdG9yKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsCj4gICAg
ICAgICAgICAgICAgICAgICAgICAgZHJtX2Nvbm5lY3Rvcl9pbml0KGRldiwgJnJhZGVvbl9jb25u
ZWN0b3ItPmJhc2UsICZyYWRlb25fZHBfY29ubmVjdG9yX2Z1bmNzLCBjb25uZWN0b3JfdHlwZSk7
Cj4gICAgICAgICAgICAgICAgICAgICAgICAgZHJtX2Nvbm5lY3Rvcl9oZWxwZXJfYWRkKCZyYWRl
b25fY29ubmVjdG9yLT5iYXNlLCAmcmFkZW9uX2RwX2Nvbm5lY3Rvcl9oZWxwZXJfZnVuY3MpOwo+
ICAgICAgICAgICAgICAgICAgICAgICAgIGlmIChpMmNfYnVzLT52YWxpZCkgewo+IC0gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgcmFkZW9uX2Nvbm5lY3Rvci0+ZGRjX2J1cyA9IHJhZGVv
bl9pMmNfbG9va3VwKHJkZXYsIGkyY19idXMpOwo+IC0gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgaWYgKHJhZGVvbl9jb25uZWN0b3ItPmRkY19idXMpCj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBzdHJ1Y3QgcmFkZW9uX2Nvbm5lY3RvciAqcmNuID0gcmFkZW9uX2Nvbm5l
Y3RvcjsKPiArCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICByY24tPmRkY19idXMg
PSByYWRlb25faTJjX2xvb2t1cChyZGV2LCBpMmNfYnVzKTsKPiArICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIGlmIChyY24tPmRkY19idXMpIHsKPiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgaGFzX2F1eCA9IHRydWU7Cj4gLSAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBlbHNlCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IGNvbm5lY3Rvci0+ZGRjID0gJnJjbi0+ZGRjX2J1cy0+YWRhcHRlcjsKPiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIH0gZWxzZSB7Cj4gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIERSTV9FUlJPUigiRFA6IEZhaWxlZCB0byBhc3NpZ24gZGRjIGJ1cyEgQ2hl
Y2sgZG1lc2cgZm9yIGkyYyBlcnJvcnMuXG4iKTsKPiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIH0KPiAgICAgICAgICAgICAgICAgICAgICAgICB9Cj4gICAgICAgICAgICAgICAgICAg
ICAgICAgc3VicGl4ZWxfb3JkZXIgPSBTdWJQaXhlbEhvcml6b250YWxSR0I7Cj4gICAgICAgICAg
ICAgICAgICAgICAgICAgZHJtX29iamVjdF9hdHRhY2hfcHJvcGVydHkoJnJhZGVvbl9jb25uZWN0
b3ItPmJhc2UuYmFzZSwKPiBAQCAtMjI1OCwxMSArMjI4MiwxNSBAQCByYWRlb25fYWRkX2F0b21f
Y29ubmVjdG9yKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsCj4gICAgICAgICAgICAgICAgICAgICAg
ICAgZHJtX2Nvbm5lY3Rvcl9pbml0KGRldiwgJnJhZGVvbl9jb25uZWN0b3ItPmJhc2UsICZyYWRl
b25fZWRwX2Nvbm5lY3Rvcl9mdW5jcywgY29ubmVjdG9yX3R5cGUpOwo+ICAgICAgICAgICAgICAg
ICAgICAgICAgIGRybV9jb25uZWN0b3JfaGVscGVyX2FkZCgmcmFkZW9uX2Nvbm5lY3Rvci0+YmFz
ZSwgJnJhZGVvbl9kcF9jb25uZWN0b3JfaGVscGVyX2Z1bmNzKTsKPiAgICAgICAgICAgICAgICAg
ICAgICAgICBpZiAoaTJjX2J1cy0+dmFsaWQpIHsKPiAtICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHJhZGVvbl9jb25uZWN0b3ItPmRkY19idXMgPSByYWRlb25faTJjX2xvb2t1cChyZGV2
LCBpMmNfYnVzKTsKPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGlmIChyYWRlb25f
Y29ubmVjdG9yLT5kZGNfYnVzKQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3Ry
dWN0IHJhZGVvbl9jb25uZWN0b3IgKnJjbiA9IHJhZGVvbl9jb25uZWN0b3I7Cj4gKwo+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgcmNuLT5kZGNfYnVzID0gcmFkZW9uX2kyY19sb29r
dXAocmRldiwgaTJjX2J1cyk7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBpZiAo
cmNuLT5kZGNfYnVzKSB7Cj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IGhhc19hdXggPSB0cnVlOwo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZWxzZQo+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb25uZWN0b3ItPmRkYyA9
ICZyY24tPmRkY19idXMtPmFkYXB0ZXI7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICB9IGVsc2Ugewo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBEUk1f
RVJST1IoIkRQOiBGYWlsZWQgdG8gYXNzaWduIGRkYyBidXMhIENoZWNrIGRtZXNnIGZvciBpMmMg
ZXJyb3JzLlxuIik7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB9Cj4gICAgICAg
ICAgICAgICAgICAgICAgICAgfQo+ICAgICAgICAgICAgICAgICAgICAgICAgIGRybV9vYmplY3Rf
YXR0YWNoX3Byb3BlcnR5KCZyYWRlb25fY29ubmVjdG9yLT5iYXNlLmJhc2UsCj4gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZGV2LT5tb2RlX2Nv
bmZpZy5zY2FsaW5nX21vZGVfcHJvcGVydHksCj4gQEAgLTIyOTcsOSArMjMyNSwxMyBAQCByYWRl
b25fYWRkX2F0b21fY29ubmVjdG9yKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsCj4gICAgICAgICAg
ICAgICAgICAgICAgICAgZHJtX2Nvbm5lY3Rvcl9pbml0KGRldiwgJnJhZGVvbl9jb25uZWN0b3It
PmJhc2UsICZyYWRlb25fbHZkc19jb25uZWN0b3JfZnVuY3MsIGNvbm5lY3Rvcl90eXBlKTsKPiAg
ICAgICAgICAgICAgICAgICAgICAgICBkcm1fY29ubmVjdG9yX2hlbHBlcl9hZGQoJnJhZGVvbl9j
b25uZWN0b3ItPmJhc2UsICZyYWRlb25fbHZkc19jb25uZWN0b3JfaGVscGVyX2Z1bmNzKTsKPiAg
ICAgICAgICAgICAgICAgICAgICAgICBpZiAoaTJjX2J1cy0+dmFsaWQpIHsKPiAtICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHJhZGVvbl9jb25uZWN0b3ItPmRkY19idXMgPSByYWRlb25f
aTJjX2xvb2t1cChyZGV2LCBpMmNfYnVzKTsKPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIGlmICghcmFkZW9uX2Nvbm5lY3Rvci0+ZGRjX2J1cykKPiArICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHN0cnVjdCByYWRlb25fY29ubmVjdG9yICpyY24gPSByYWRlb25fY29ubmVj
dG9yOwo+ICsKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJjbi0+ZGRjX2J1cyA9
IHJhZGVvbl9pMmNfbG9va3VwKHJkZXYsIGkyY19idXMpOwo+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgaWYgKCFyY24tPmRkY19idXMpCj4gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIERSTV9FUlJPUigiTFZEUzogRmFpbGVkIHRvIGFzc2lnbiBkZGMgYnVz
ISBDaGVjayBkbWVzZyBmb3IgaTJjIGVycm9ycy5cbiIpOwo+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgZWxzZQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBjb25uZWN0b3ItPmRkYyA9ICZyY24tPmRkY19idXMtPmFkYXB0ZXI7Cj4gICAgICAgICAgICAg
ICAgICAgICAgICAgfQo+ICAgICAgICAgICAgICAgICAgICAgICAgIGRybV9vYmplY3RfYXR0YWNo
X3Byb3BlcnR5KCZyYWRlb25fY29ubmVjdG9yLT5iYXNlLmJhc2UsCj4gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZGV2LT5tb2RlX2NvbmZpZy5z
Y2FsaW5nX21vZGVfcHJvcGVydHksCj4gQEAgLTIzODQsNiArMjQxNiw5IEBAIHJhZGVvbl9hZGRf
bGVnYWN5X2Nvbm5lY3RvcihzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LAo+ICAgICAgICAgICAgICAg
ICAgICAgICAgIHJhZGVvbl9jb25uZWN0b3ItPmRkY19idXMgPSByYWRlb25faTJjX2xvb2t1cChy
ZGV2LCBpMmNfYnVzKTsKPiAgICAgICAgICAgICAgICAgICAgICAgICBpZiAoIXJhZGVvbl9jb25u
ZWN0b3ItPmRkY19idXMpCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBEUk1fRVJS
T1IoIlZHQTogRmFpbGVkIHRvIGFzc2lnbiBkZGMgYnVzISBDaGVjayBkbWVzZyBmb3IgaTJjIGVy
cm9ycy5cbiIpOwo+ICsgICAgICAgICAgICAgICAgICAgICAgIGVsc2UKPiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIGNvbm5lY3Rvci0+ZGRjID0KPiArICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgJnJhZGVvbl9jb25uZWN0b3ItPmRkY19idXMtPmFkYXB0ZXI7
Cj4gICAgICAgICAgICAgICAgIH0KPiAgICAgICAgICAgICAgICAgcmFkZW9uX2Nvbm5lY3Rvci0+
ZGFjX2xvYWRfZGV0ZWN0ID0gdHJ1ZTsKPiAgICAgICAgICAgICAgICAgZHJtX29iamVjdF9hdHRh
Y2hfcHJvcGVydHkoJnJhZGVvbl9jb25uZWN0b3ItPmJhc2UuYmFzZSwKPiBAQCAtMjQwMSw2ICsy
NDM2LDkgQEAgcmFkZW9uX2FkZF9sZWdhY3lfY29ubmVjdG9yKHN0cnVjdCBkcm1fZGV2aWNlICpk
ZXYsCj4gICAgICAgICAgICAgICAgICAgICAgICAgcmFkZW9uX2Nvbm5lY3Rvci0+ZGRjX2J1cyA9
IHJhZGVvbl9pMmNfbG9va3VwKHJkZXYsIGkyY19idXMpOwo+ICAgICAgICAgICAgICAgICAgICAg
ICAgIGlmICghcmFkZW9uX2Nvbm5lY3Rvci0+ZGRjX2J1cykKPiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIERSTV9FUlJPUigiRFZJQTogRmFpbGVkIHRvIGFzc2lnbiBkZGMgYnVzISBD
aGVjayBkbWVzZyBmb3IgaTJjIGVycm9ycy5cbiIpOwo+ICsgICAgICAgICAgICAgICAgICAgICAg
IGVsc2UKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbm5lY3Rvci0+ZGRjID0K
PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgJnJhZGVvbl9jb25uZWN0
b3ItPmRkY19idXMtPmFkYXB0ZXI7Cj4gICAgICAgICAgICAgICAgIH0KPiAgICAgICAgICAgICAg
ICAgcmFkZW9uX2Nvbm5lY3Rvci0+ZGFjX2xvYWRfZGV0ZWN0ID0gdHJ1ZTsKPiAgICAgICAgICAg
ICAgICAgZHJtX29iamVjdF9hdHRhY2hfcHJvcGVydHkoJnJhZGVvbl9jb25uZWN0b3ItPmJhc2Uu
YmFzZSwKPiBAQCAtMjQxOSw2ICsyNDU3LDkgQEAgcmFkZW9uX2FkZF9sZWdhY3lfY29ubmVjdG9y
KHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsCj4gICAgICAgICAgICAgICAgICAgICAgICAgcmFkZW9u
X2Nvbm5lY3Rvci0+ZGRjX2J1cyA9IHJhZGVvbl9pMmNfbG9va3VwKHJkZXYsIGkyY19idXMpOwo+
ICAgICAgICAgICAgICAgICAgICAgICAgIGlmICghcmFkZW9uX2Nvbm5lY3Rvci0+ZGRjX2J1cykK
PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIERSTV9FUlJPUigiRFZJOiBGYWlsZWQg
dG8gYXNzaWduIGRkYyBidXMhIENoZWNrIGRtZXNnIGZvciBpMmMgZXJyb3JzLlxuIik7Cj4gKyAg
ICAgICAgICAgICAgICAgICAgICAgZWxzZQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgY29ubmVjdG9yLT5kZGMgPQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAmcmFkZW9uX2Nvbm5lY3Rvci0+ZGRjX2J1cy0+YWRhcHRlcjsKPiAgICAgICAgICAgICAg
ICAgfQo+ICAgICAgICAgICAgICAgICBpZiAoY29ubmVjdG9yX3R5cGUgPT0gRFJNX01PREVfQ09O
TkVDVE9SX0RWSUkpIHsKPiAgICAgICAgICAgICAgICAgICAgICAgICByYWRlb25fY29ubmVjdG9y
LT5kYWNfbG9hZF9kZXRlY3QgPSB0cnVlOwo+IEBAIC0yNDY0LDYgKzI1MDUsOSBAQCByYWRlb25f
YWRkX2xlZ2FjeV9jb25uZWN0b3Ioc3RydWN0IGRybV9kZXZpY2UgKmRldiwKPiAgICAgICAgICAg
ICAgICAgICAgICAgICByYWRlb25fY29ubmVjdG9yLT5kZGNfYnVzID0gcmFkZW9uX2kyY19sb29r
dXAocmRldiwgaTJjX2J1cyk7Cj4gICAgICAgICAgICAgICAgICAgICAgICAgaWYgKCFyYWRlb25f
Y29ubmVjdG9yLT5kZGNfYnVzKQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgRFJN
X0VSUk9SKCJMVkRTOiBGYWlsZWQgdG8gYXNzaWduIGRkYyBidXMhIENoZWNrIGRtZXNnIGZvciBp
MmMgZXJyb3JzLlxuIik7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgZWxzZQo+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgY29ubmVjdG9yLT5kZGMgPQo+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAmcmFkZW9uX2Nvbm5lY3Rvci0+ZGRjX2J1cy0+YWRh
cHRlcjsKPiAgICAgICAgICAgICAgICAgfQo+ICAgICAgICAgICAgICAgICBkcm1fb2JqZWN0X2F0
dGFjaF9wcm9wZXJ0eSgmcmFkZW9uX2Nvbm5lY3Rvci0+YmFzZS5iYXNlLAo+ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBkZXYtPm1vZGVfY29uZmlnLnNjYWxp
bmdfbW9kZV9wcm9wZXJ0eSwKPiAtLQo+IDIuMTcuMQo+Cj4gX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KPiBhbWQtZ2Z4IG1haWxpbmcgbGlzdAo+IGFtZC1n
ZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
YW1kLWdmeA==
