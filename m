Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B20C977218
	for <lists+amd-gfx@lfdr.de>; Fri, 26 Jul 2019 21:29:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADEBE6EE43;
	Fri, 26 Jul 2019 19:28:56 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D9436EE3E;
 Fri, 26 Jul 2019 19:28:55 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id n9so30426717wrr.4;
 Fri, 26 Jul 2019 12:28:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WlhVURpZ/hpWKcZg6G7ubX3iip3/WarcwEPBASycLiI=;
 b=RlSsKlVWwg8QbRL+bNr1TF1EPIhvRGKEipEWxG4qRi0F8cAZA3YzJ401XPQjHs/Rb/
 95c0Z1NQqZ0tQW9ZNL5nOiNTZNOgfmDEp6+WLiTGTlwdQRyEeZvEM7Z5sdqPMW1Tn6V6
 zDFyfLQsKR8kzKHomrmG8gsGD4jFt9988vaUYJO0JHzb0gFVKgCflj3bpU9q5kfT/ddX
 mFg3ZcA2I86u2Pz/OLlLRqSMlXLdF5MLW5aixjPdZNiXU/AV4N+hgDybgTKCuu7kIVAy
 AVhRzihRxa/T3LWKdVk49bUCioTRg46zHV7X55R/hQi0yxx1as/nqi8Bgcb19XxXX4VL
 LBbA==
X-Gm-Message-State: APjAAAUy2P32OxqVOfm5P0ybs+XNJysG7yZtDZiXbqf62XKNDEIQW84Y
 J1tOafMjKMvmvTPAtA+Vh+TCjLtbggg3F568pjE8sOSjKS0=
X-Google-Smtp-Source: APXvYqzpcFgYjr3nPHTNVylfPY0NzxJ0wYUeL465LJY8jLSGrpOSyOFC/q9RynZjA+7mDtyLVkXX+dHOYnQYjA1Sdy4=
X-Received: by 2002:adf:dfc5:: with SMTP id q5mr712193wrn.142.1564169334061;
 Fri, 26 Jul 2019 12:28:54 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1564161140.git.andrzej.p@collabora.com>
 <7fee0fa0d0f77af6595d283d5f3ae5d551475821.1564161140.git.andrzej.p@collabora.com>
In-Reply-To: <7fee0fa0d0f77af6595d283d5f3ae5d551475821.1564161140.git.andrzej.p@collabora.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 26 Jul 2019 15:28:42 -0400
Message-ID: <CADnq5_O1B59Q+68fJgtf_bn_=WQ9yrVPq-V5tL1VQ3+vzgf1Zw@mail.gmail.com>
Subject: Re: [PATCH v6 22/24] drm/amdgpu: Provide ddc symlink in connector
 sysfs directory
To: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=WlhVURpZ/hpWKcZg6G7ubX3iip3/WarcwEPBASycLiI=;
 b=YGHzDAkDZGIIwKGCOA2L4uxQ1GrG4EGX0d3KOEE85zGlmZlXlJeQbJeKId2XJqrTZ4
 R4G05Dvuof3wZ3C8+eSkgMqFe/B9RYjsvsbFBjmRx57ZAsZFz0GibFjNW5jpz2Ehp2vn
 a1kuqoinV1PirvY3DAWvI6N67fz/ZAaoFULIkptRfLf26vYaI8qNf34ncqwlAqFYigKA
 fWGxjbG7XvbvaUfwe2PjweKMucOzsbNGmoxbVoJxANvCEvIrJdnSPsC1PNv2KnORXzbJ
 RjwM/LCAj3/jYLw7hPeHge6IjV4VNi4xp52l9fA5dICljkLwVq8zF9QS2MNN+9LB2ytM
 w9TA==
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
Cc: Maxime Ripard <mripard@kernel.org>, "Y.C. Chen" <yc_chen@aspeedtech.com>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Ramalingam C <ramalingam.c@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris@chris-wilson.co.uk>, Andrzej Hajda <a.hajda@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Shawn Guo <shawnguo@kernel.org>, kernel@collabora.com,
 Fabio Estevam <festevam@gmail.com>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 "David \(ChunMing\) Zhou" <David1.Zhou@amd.com>,
 linux-samsung-soc@vger.kernel.org, Joonyoung Shim <jy0922.shim@samsung.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Sandy Huang <hjc@rock-chips.com>, Sam Ravnborg <sam@ravnborg.org>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
 linux-rockchip@lists.infradead.org, Chen-Yu Tsai <wens@csie.org>,
 Kukjin Kim <kgene@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 NXP Linux Team <linux-imx@nxp.com>, CK Hu <ck.hu@mediatek.com>,
 Dave Airlie <airlied@redhat.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Shashank Sharma <shashank.sharma@intel.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Jonas Karlman <jonas@kwiboo.se>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Jyri Sarha <jsarha@ti.com>, Inki Dae <inki.dae@samsung.com>,
 Mamta Shukla <mamtashukla555@gmail.com>, linux-mediatek@lists.infradead.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, linux-tegra@vger.kernel.org,
 Daniel Vetter <daniel@ffwll.ch>, Thomas Gleixner <tglx@linutronix.de>,
 Vincent Abriou <vincent.abriou@st.com>, Allison Randal <allison@lohutok.net>,
 Sean Paul <sean@poorly.run>, Jernej Skrabec <jernej.skrabec@siol.net>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Eric Anholt <eric@anholt.net>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Douglas Anderson <dianders@chromium.org>, LKML <linux-kernel@vger.kernel.org>,
 Todor Tomov <todor.tomov@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Huang Rui <ray.huang@amd.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Alex Deucher <alexander.deucher@amd.com>,
 freedreno <freedreno@lists.freedesktop.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gRnJpLCBKdWwgMjYsIDIwMTkgYXQgMToyOCBQTSBBbmRyemVqIFBpZXRyYXNpZXdpY3oKPGFu
ZHJ6ZWoucEBjb2xsYWJvcmEuY29tPiB3cm90ZToKPgo+IFVzZSB0aGUgZGRjIHBvaW50ZXIgcHJv
dmlkZWQgYnkgdGhlIGdlbmVyaWMgY29ubmVjdG9yLgo+Cj4gU2lnbmVkLW9mZi1ieTogQW5kcnpl
aiBQaWV0cmFzaWV3aWN6IDxhbmRyemVqLnBAY29sbGFib3JhLmNvbT4KCk5vdGUgdGhhdCB0aGlz
IG9ubHkgY292ZXJzIHRoZSBsZWdhY3kgZGlzcGxheSBjb2RlLiAgVGhlIG5ldyBEQwpkaXNwbGF5
IGNvZGUgYWxzbyBuZWVkcyB0byBiZSBjb252ZXJ0ZWQuICBTZWU6CmRyaXZlcnMvZ3B1L2RybS9h
bWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMKZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNw
bGF5L2FtZGdwdV9kbS9hbWRncHVfZG1fbXN0X3R5cGVzLmMKV2l0aCB0aG9zZSB1cGRhdGVkIGFz
IHdlbGw6CkFja2VkLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+
Cgo+IC0tLQo+ICAuLi4vZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9jb25uZWN0b3JzLmMgICAg
fCA5NiArKysrKysrKysrKysrKy0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA3MCBpbnNlcnRpb25z
KCspLCAyNiBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfY29ubmVjdG9ycy5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X2Nvbm5lY3RvcnMuYwo+IGluZGV4IDczYjJlZGU3NzNkMy4uZWNlNTVjOGZhNjczIDEw
MDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9jb25uZWN0b3Jz
LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfY29ubmVjdG9ycy5j
Cj4gQEAgLTE1MDUsNiArMTUwNSw3IEBAIGFtZGdwdV9jb25uZWN0b3JfYWRkKHN0cnVjdCBhbWRn
cHVfZGV2aWNlICphZGV2LAo+ICAgICAgICAgc3RydWN0IGFtZGdwdV9jb25uZWN0b3JfYXRvbV9k
aWcgKmFtZGdwdV9kaWdfY29ubmVjdG9yOwo+ICAgICAgICAgc3RydWN0IGRybV9lbmNvZGVyICpl
bmNvZGVyOwo+ICAgICAgICAgc3RydWN0IGFtZGdwdV9lbmNvZGVyICphbWRncHVfZW5jb2RlcjsK
PiArICAgICAgIHN0cnVjdCBpMmNfYWRhcHRlciAqZGRjID0gTlVMTDsKPiAgICAgICAgIHVpbnQz
Ml90IHN1YnBpeGVsX29yZGVyID0gU3ViUGl4ZWxOb25lOwo+ICAgICAgICAgYm9vbCBzaGFyZWRf
ZGRjID0gZmFsc2U7Cj4gICAgICAgICBib29sIGlzX2RwX2JyaWRnZSA9IGZhbHNlOwo+IEBAIC0x
NTc0LDE3ICsxNTc1LDIxIEBAIGFtZGdwdV9jb25uZWN0b3JfYWRkKHN0cnVjdCBhbWRncHVfZGV2
aWNlICphZGV2LAo+ICAgICAgICAgICAgICAgICBhbWRncHVfY29ubmVjdG9yLT5jb25fcHJpdiA9
IGFtZGdwdV9kaWdfY29ubmVjdG9yOwo+ICAgICAgICAgICAgICAgICBpZiAoaTJjX2J1cy0+dmFs
aWQpIHsKPiAgICAgICAgICAgICAgICAgICAgICAgICBhbWRncHVfY29ubmVjdG9yLT5kZGNfYnVz
ID0gYW1kZ3B1X2kyY19sb29rdXAoYWRldiwgaTJjX2J1cyk7Cj4gLSAgICAgICAgICAgICAgICAg
ICAgICAgaWYgKGFtZGdwdV9jb25uZWN0b3ItPmRkY19idXMpCj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgaWYgKGFtZGdwdV9jb25uZWN0b3ItPmRkY19idXMpIHsKPiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIGhhc19hdXggPSB0cnVlOwo+IC0gICAgICAgICAgICAgICAgICAgICAg
IGVsc2UKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGRkYyA9ICZhbWRncHVfY29u
bmVjdG9yLT5kZGNfYnVzLT5hZGFwdGVyOwo+ICsgICAgICAgICAgICAgICAgICAgICAgIH0gZWxz
ZSB7Cj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBEUk1fRVJST1IoIkRQOiBGYWls
ZWQgdG8gYXNzaWduIGRkYyBidXMhIENoZWNrIGRtZXNnIGZvciBpMmMgZXJyb3JzLlxuIik7Cj4g
KyAgICAgICAgICAgICAgICAgICAgICAgfQo+ICAgICAgICAgICAgICAgICB9Cj4gICAgICAgICAg
ICAgICAgIHN3aXRjaCAoY29ubmVjdG9yX3R5cGUpIHsKPiAgICAgICAgICAgICAgICAgY2FzZSBE
Uk1fTU9ERV9DT05ORUNUT1JfVkdBOgo+ICAgICAgICAgICAgICAgICBjYXNlIERSTV9NT0RFX0NP
Tk5FQ1RPUl9EVklBOgo+ICAgICAgICAgICAgICAgICBkZWZhdWx0Ogo+IC0gICAgICAgICAgICAg
ICAgICAgICAgIGRybV9jb25uZWN0b3JfaW5pdChkZXYsICZhbWRncHVfY29ubmVjdG9yLT5iYXNl
LAo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAmYW1kZ3B1X2Nv
bm5lY3Rvcl9kcF9mdW5jcywgY29ubmVjdG9yX3R5cGUpOwo+ICsgICAgICAgICAgICAgICAgICAg
ICAgIGRybV9jb25uZWN0b3JfaW5pdF93aXRoX2RkYyhkZXYsICZhbWRncHVfY29ubmVjdG9yLT5i
YXNlLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAmYW1kZ3B1X2Nvbm5lY3Rvcl9kcF9mdW5jcywKPiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgY29ubmVjdG9yX3R5cGUsCj4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGRkYyk7Cj4gICAgICAgICAg
ICAgICAgICAgICAgICAgZHJtX2Nvbm5lY3Rvcl9oZWxwZXJfYWRkKCZhbWRncHVfY29ubmVjdG9y
LT5iYXNlLAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAmYW1kZ3B1X2Nvbm5lY3Rvcl9kcF9oZWxwZXJfZnVuY3MpOwo+ICAgICAgICAgICAgICAgICAg
ICAgICAgIGNvbm5lY3Rvci0+aW50ZXJsYWNlX2FsbG93ZWQgPSB0cnVlOwo+IEBAIC0xNjAyLDgg
KzE2MDcsMTAgQEAgYW1kZ3B1X2Nvbm5lY3Rvcl9hZGQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFk
ZXYsCj4gICAgICAgICAgICAgICAgIGNhc2UgRFJNX01PREVfQ09OTkVDVE9SX0hETUlBOgo+ICAg
ICAgICAgICAgICAgICBjYXNlIERSTV9NT0RFX0NPTk5FQ1RPUl9IRE1JQjoKPiAgICAgICAgICAg
ICAgICAgY2FzZSBEUk1fTU9ERV9DT05ORUNUT1JfRGlzcGxheVBvcnQ6Cj4gLSAgICAgICAgICAg
ICAgICAgICAgICAgZHJtX2Nvbm5lY3Rvcl9pbml0KGRldiwgJmFtZGdwdV9jb25uZWN0b3ItPmJh
c2UsCj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICZhbWRncHVf
Y29ubmVjdG9yX2RwX2Z1bmNzLCBjb25uZWN0b3JfdHlwZSk7Cj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgZHJtX2Nvbm5lY3Rvcl9pbml0X3dpdGhfZGRjKGRldiwgJmFtZGdwdV9jb25uZWN0b3It
PmJhc2UsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICZhbWRncHVfY29ubmVjdG9yX2RwX2Z1bmNzLAo+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb25uZWN0b3JfdHlwZSwKPiArICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZGRjKTsKPiAgICAgICAg
ICAgICAgICAgICAgICAgICBkcm1fY29ubmVjdG9yX2hlbHBlcl9hZGQoJmFtZGdwdV9jb25uZWN0
b3ItPmJhc2UsCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICZhbWRncHVfY29ubmVjdG9yX2RwX2hlbHBlcl9mdW5jcyk7Cj4gICAgICAgICAgICAgICAg
ICAgICAgICAgZHJtX29iamVjdF9hdHRhY2hfcHJvcGVydHkoJmFtZGdwdV9jb25uZWN0b3ItPmJh
c2UuYmFzZSwKPiBAQCAtMTY0NCw4ICsxNjUxLDEwIEBAIGFtZGdwdV9jb25uZWN0b3JfYWRkKHN0
cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAo+ICAgICAgICAgICAgICAgICAgICAgICAgIGJyZWFr
Owo+ICAgICAgICAgICAgICAgICBjYXNlIERSTV9NT0RFX0NPTk5FQ1RPUl9MVkRTOgo+ICAgICAg
ICAgICAgICAgICBjYXNlIERSTV9NT0RFX0NPTk5FQ1RPUl9lRFA6Cj4gLSAgICAgICAgICAgICAg
ICAgICAgICAgZHJtX2Nvbm5lY3Rvcl9pbml0KGRldiwgJmFtZGdwdV9jb25uZWN0b3ItPmJhc2Us
Cj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICZhbWRncHVfY29u
bmVjdG9yX2VkcF9mdW5jcywgY29ubmVjdG9yX3R5cGUpOwo+ICsgICAgICAgICAgICAgICAgICAg
ICAgIGRybV9jb25uZWN0b3JfaW5pdF93aXRoX2RkYyhkZXYsICZhbWRncHVfY29ubmVjdG9yLT5i
YXNlLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAmYW1kZ3B1X2Nvbm5lY3Rvcl9lZHBfZnVuY3MsCj4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbm5lY3Rvcl90eXBlLAo+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBkZGMpOwo+ICAgICAgICAg
ICAgICAgICAgICAgICAgIGRybV9jb25uZWN0b3JfaGVscGVyX2FkZCgmYW1kZ3B1X2Nvbm5lY3Rv
ci0+YmFzZSwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgJmFtZGdwdV9jb25uZWN0b3JfZHBfaGVscGVyX2Z1bmNzKTsKPiAgICAgICAgICAgICAgICAg
ICAgICAgICBkcm1fb2JqZWN0X2F0dGFjaF9wcm9wZXJ0eSgmYW1kZ3B1X2Nvbm5lY3Rvci0+YmFz
ZS5iYXNlLAo+IEBAIC0xNjU5LDEzICsxNjY4LDE4IEBAIGFtZGdwdV9jb25uZWN0b3JfYWRkKHN0
cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAo+ICAgICAgICAgfSBlbHNlIHsKPiAgICAgICAgICAg
ICAgICAgc3dpdGNoIChjb25uZWN0b3JfdHlwZSkgewo+ICAgICAgICAgICAgICAgICBjYXNlIERS
TV9NT0RFX0NPTk5FQ1RPUl9WR0E6Cj4gLSAgICAgICAgICAgICAgICAgICAgICAgZHJtX2Nvbm5l
Y3Rvcl9pbml0KGRldiwgJmFtZGdwdV9jb25uZWN0b3ItPmJhc2UsICZhbWRncHVfY29ubmVjdG9y
X3ZnYV9mdW5jcywgY29ubmVjdG9yX3R5cGUpOwo+IC0gICAgICAgICAgICAgICAgICAgICAgIGRy
bV9jb25uZWN0b3JfaGVscGVyX2FkZCgmYW1kZ3B1X2Nvbm5lY3Rvci0+YmFzZSwgJmFtZGdwdV9j
b25uZWN0b3JfdmdhX2hlbHBlcl9mdW5jcyk7Cj4gICAgICAgICAgICAgICAgICAgICAgICAgaWYg
KGkyY19idXMtPnZhbGlkKSB7Cj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBhbWRn
cHVfY29ubmVjdG9yLT5kZGNfYnVzID0gYW1kZ3B1X2kyY19sb29rdXAoYWRldiwgaTJjX2J1cyk7
Cj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBpZiAoIWFtZGdwdV9jb25uZWN0b3It
PmRkY19idXMpCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIERSTV9F
UlJPUigiVkdBOiBGYWlsZWQgdG8gYXNzaWduIGRkYyBidXMhIENoZWNrIGRtZXNnIGZvciBpMmMg
ZXJyb3JzLlxuIik7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBlbHNlCj4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGRkYyA9ICZhbWRncHVfY29ubmVj
dG9yLT5kZGNfYnVzLT5hZGFwdGVyOwo+ICAgICAgICAgICAgICAgICAgICAgICAgIH0KPiArICAg
ICAgICAgICAgICAgICAgICAgICBkcm1fY29ubmVjdG9yX2luaXRfd2l0aF9kZGMoZGV2LCAmYW1k
Z3B1X2Nvbm5lY3Rvci0+YmFzZSwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgJmFtZGdwdV9jb25uZWN0b3JfdmdhX2Z1bmNzLAo+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb25uZWN0b3JfdHlw
ZSwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ZGRjKTsKPiArICAgICAgICAgICAgICAgICAgICAgICBkcm1fY29ubmVjdG9yX2hlbHBlcl9hZGQo
JmFtZGdwdV9jb25uZWN0b3ItPmJhc2UsICZhbWRncHVfY29ubmVjdG9yX3ZnYV9oZWxwZXJfZnVu
Y3MpOwo+ICAgICAgICAgICAgICAgICAgICAgICAgIGFtZGdwdV9jb25uZWN0b3ItPmRhY19sb2Fk
X2RldGVjdCA9IHRydWU7Cj4gICAgICAgICAgICAgICAgICAgICAgICAgZHJtX29iamVjdF9hdHRh
Y2hfcHJvcGVydHkoJmFtZGdwdV9jb25uZWN0b3ItPmJhc2UuYmFzZSwKPiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBhZGV2LT5tb2RlX2luZm8u
bG9hZF9kZXRlY3RfcHJvcGVydHksCj4gQEAgLTE2NzksMTMgKzE2OTMsMTggQEAgYW1kZ3B1X2Nv
bm5lY3Rvcl9hZGQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsCj4gICAgICAgICAgICAgICAg
ICAgICAgICAgY29ubmVjdG9yLT5kb3VibGVzY2FuX2FsbG93ZWQgPSB0cnVlOwo+ICAgICAgICAg
ICAgICAgICAgICAgICAgIGJyZWFrOwo+ICAgICAgICAgICAgICAgICBjYXNlIERSTV9NT0RFX0NP
Tk5FQ1RPUl9EVklBOgo+IC0gICAgICAgICAgICAgICAgICAgICAgIGRybV9jb25uZWN0b3JfaW5p
dChkZXYsICZhbWRncHVfY29ubmVjdG9yLT5iYXNlLCAmYW1kZ3B1X2Nvbm5lY3Rvcl92Z2FfZnVu
Y3MsIGNvbm5lY3Rvcl90eXBlKTsKPiAtICAgICAgICAgICAgICAgICAgICAgICBkcm1fY29ubmVj
dG9yX2hlbHBlcl9hZGQoJmFtZGdwdV9jb25uZWN0b3ItPmJhc2UsICZhbWRncHVfY29ubmVjdG9y
X3ZnYV9oZWxwZXJfZnVuY3MpOwo+ICAgICAgICAgICAgICAgICAgICAgICAgIGlmIChpMmNfYnVz
LT52YWxpZCkgewo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYW1kZ3B1X2Nvbm5l
Y3Rvci0+ZGRjX2J1cyA9IGFtZGdwdV9pMmNfbG9va3VwKGFkZXYsIGkyY19idXMpOwo+ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgaWYgKCFhbWRncHVfY29ubmVjdG9yLT5kZGNfYnVz
KQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBEUk1fRVJST1IoIkRW
SUE6IEZhaWxlZCB0byBhc3NpZ24gZGRjIGJ1cyEgQ2hlY2sgZG1lc2cgZm9yIGkyYyBlcnJvcnMu
XG4iKTsKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGVsc2UKPiArICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZGRjID0gJmFtZGdwdV9jb25uZWN0b3ItPmRk
Y19idXMtPmFkYXB0ZXI7Cj4gICAgICAgICAgICAgICAgICAgICAgICAgfQo+ICsgICAgICAgICAg
ICAgICAgICAgICAgIGRybV9jb25uZWN0b3JfaW5pdF93aXRoX2RkYyhkZXYsICZhbWRncHVfY29u
bmVjdG9yLT5iYXNlLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAmYW1kZ3B1X2Nvbm5lY3Rvcl92Z2FfZnVuY3MsCj4gKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbm5lY3Rvcl90eXBlLAo+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBkZGMpOwo+
ICsgICAgICAgICAgICAgICAgICAgICAgIGRybV9jb25uZWN0b3JfaGVscGVyX2FkZCgmYW1kZ3B1
X2Nvbm5lY3Rvci0+YmFzZSwgJmFtZGdwdV9jb25uZWN0b3JfdmdhX2hlbHBlcl9mdW5jcyk7Cj4g
ICAgICAgICAgICAgICAgICAgICAgICAgYW1kZ3B1X2Nvbm5lY3Rvci0+ZGFjX2xvYWRfZGV0ZWN0
ID0gdHJ1ZTsKPiAgICAgICAgICAgICAgICAgICAgICAgICBkcm1fb2JqZWN0X2F0dGFjaF9wcm9w
ZXJ0eSgmYW1kZ3B1X2Nvbm5lY3Rvci0+YmFzZS5iYXNlLAo+ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGFkZXYtPm1vZGVfaW5mby5sb2FkX2Rl
dGVjdF9wcm9wZXJ0eSwKPiBAQCAtMTcwNCwxMyArMTcyMywxOCBAQCBhbWRncHVfY29ubmVjdG9y
X2FkZChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwKPiAgICAgICAgICAgICAgICAgICAgICAg
ICBpZiAoIWFtZGdwdV9kaWdfY29ubmVjdG9yKQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgZ290byBmYWlsZWQ7Cj4gICAgICAgICAgICAgICAgICAgICAgICAgYW1kZ3B1X2Nvbm5l
Y3Rvci0+Y29uX3ByaXYgPSBhbWRncHVfZGlnX2Nvbm5lY3RvcjsKPiAtICAgICAgICAgICAgICAg
ICAgICAgICBkcm1fY29ubmVjdG9yX2luaXQoZGV2LCAmYW1kZ3B1X2Nvbm5lY3Rvci0+YmFzZSwg
JmFtZGdwdV9jb25uZWN0b3JfZHZpX2Z1bmNzLCBjb25uZWN0b3JfdHlwZSk7Cj4gLSAgICAgICAg
ICAgICAgICAgICAgICAgZHJtX2Nvbm5lY3Rvcl9oZWxwZXJfYWRkKCZhbWRncHVfY29ubmVjdG9y
LT5iYXNlLCAmYW1kZ3B1X2Nvbm5lY3Rvcl9kdmlfaGVscGVyX2Z1bmNzKTsKPiAgICAgICAgICAg
ICAgICAgICAgICAgICBpZiAoaTJjX2J1cy0+dmFsaWQpIHsKPiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIGFtZGdwdV9jb25uZWN0b3ItPmRkY19idXMgPSBhbWRncHVfaTJjX2xvb2t1
cChhZGV2LCBpMmNfYnVzKTsKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGlmICgh
YW1kZ3B1X2Nvbm5lY3Rvci0+ZGRjX2J1cykKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgRFJNX0VSUk9SKCJEVkk6IEZhaWxlZCB0byBhc3NpZ24gZGRjIGJ1cyEgQ2hl
Y2sgZG1lc2cgZm9yIGkyYyBlcnJvcnMuXG4iKTsKPiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIGVsc2UKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZGRj
ID0gJmFtZGdwdV9jb25uZWN0b3ItPmRkY19idXMtPmFkYXB0ZXI7Cj4gICAgICAgICAgICAgICAg
ICAgICAgICAgfQo+ICsgICAgICAgICAgICAgICAgICAgICAgIGRybV9jb25uZWN0b3JfaW5pdF93
aXRoX2RkYyhkZXYsICZhbWRncHVfY29ubmVjdG9yLT5iYXNlLAo+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAmYW1kZ3B1X2Nvbm5lY3Rvcl9kdmlf
ZnVuY3MsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIGNvbm5lY3Rvcl90eXBlLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBkZGMpOwo+ICsgICAgICAgICAgICAgICAgICAgICAgIGRybV9jb25u
ZWN0b3JfaGVscGVyX2FkZCgmYW1kZ3B1X2Nvbm5lY3Rvci0+YmFzZSwgJmFtZGdwdV9jb25uZWN0
b3JfZHZpX2hlbHBlcl9mdW5jcyk7Cj4gICAgICAgICAgICAgICAgICAgICAgICAgc3VicGl4ZWxf
b3JkZXIgPSBTdWJQaXhlbEhvcml6b250YWxSR0I7Cj4gICAgICAgICAgICAgICAgICAgICAgICAg
ZHJtX29iamVjdF9hdHRhY2hfcHJvcGVydHkoJmFtZGdwdV9jb25uZWN0b3ItPmJhc2UuYmFzZSwK
PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBh
ZGV2LT5tb2RlX2luZm8uY29oZXJlbnRfbW9kZV9wcm9wZXJ0eSwKPiBAQCAtMTc1NCwxMyArMTc3
OCwxOCBAQCBhbWRncHVfY29ubmVjdG9yX2FkZChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwK
PiAgICAgICAgICAgICAgICAgICAgICAgICBpZiAoIWFtZGdwdV9kaWdfY29ubmVjdG9yKQo+ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZ290byBmYWlsZWQ7Cj4gICAgICAgICAgICAg
ICAgICAgICAgICAgYW1kZ3B1X2Nvbm5lY3Rvci0+Y29uX3ByaXYgPSBhbWRncHVfZGlnX2Nvbm5l
Y3RvcjsKPiAtICAgICAgICAgICAgICAgICAgICAgICBkcm1fY29ubmVjdG9yX2luaXQoZGV2LCAm
YW1kZ3B1X2Nvbm5lY3Rvci0+YmFzZSwgJmFtZGdwdV9jb25uZWN0b3JfZHZpX2Z1bmNzLCBjb25u
ZWN0b3JfdHlwZSk7Cj4gLSAgICAgICAgICAgICAgICAgICAgICAgZHJtX2Nvbm5lY3Rvcl9oZWxw
ZXJfYWRkKCZhbWRncHVfY29ubmVjdG9yLT5iYXNlLCAmYW1kZ3B1X2Nvbm5lY3Rvcl9kdmlfaGVs
cGVyX2Z1bmNzKTsKPiAgICAgICAgICAgICAgICAgICAgICAgICBpZiAoaTJjX2J1cy0+dmFsaWQp
IHsKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGFtZGdwdV9jb25uZWN0b3ItPmRk
Y19idXMgPSBhbWRncHVfaTJjX2xvb2t1cChhZGV2LCBpMmNfYnVzKTsKPiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIGlmICghYW1kZ3B1X2Nvbm5lY3Rvci0+ZGRjX2J1cykKPiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgRFJNX0VSUk9SKCJIRE1JOiBGYWls
ZWQgdG8gYXNzaWduIGRkYyBidXMhIENoZWNrIGRtZXNnIGZvciBpMmMgZXJyb3JzLlxuIik7Cj4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBlbHNlCj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIGRkYyA9ICZhbWRncHVfY29ubmVjdG9yLT5kZGNfYnVzLT5h
ZGFwdGVyOwo+ICAgICAgICAgICAgICAgICAgICAgICAgIH0KPiArICAgICAgICAgICAgICAgICAg
ICAgICBkcm1fY29ubmVjdG9yX2luaXRfd2l0aF9kZGMoZGV2LCAmYW1kZ3B1X2Nvbm5lY3Rvci0+
YmFzZSwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgJmFtZGdwdV9jb25uZWN0b3JfZHZpX2Z1bmNzLAo+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb25uZWN0b3JfdHlwZSwKPiArICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZGRjKTsKPiArICAgICAg
ICAgICAgICAgICAgICAgICBkcm1fY29ubmVjdG9yX2hlbHBlcl9hZGQoJmFtZGdwdV9jb25uZWN0
b3ItPmJhc2UsICZhbWRncHVfY29ubmVjdG9yX2R2aV9oZWxwZXJfZnVuY3MpOwo+ICAgICAgICAg
ICAgICAgICAgICAgICAgIGRybV9vYmplY3RfYXR0YWNoX3Byb3BlcnR5KCZhbWRncHVfY29ubmVj
dG9yLT5iYXNlLmJhc2UsCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgYWRldi0+bW9kZV9pbmZvLmNvaGVyZW50X21vZGVfcHJvcGVydHksCj4g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgMSk7
Cj4gQEAgLTE3OTYsMTUgKzE4MjUsMjAgQEAgYW1kZ3B1X2Nvbm5lY3Rvcl9hZGQoc3RydWN0IGFt
ZGdwdV9kZXZpY2UgKmFkZXYsCj4gICAgICAgICAgICAgICAgICAgICAgICAgaWYgKCFhbWRncHVf
ZGlnX2Nvbm5lY3RvcikKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGdvdG8gZmFp
bGVkOwo+ICAgICAgICAgICAgICAgICAgICAgICAgIGFtZGdwdV9jb25uZWN0b3ItPmNvbl9wcml2
ID0gYW1kZ3B1X2RpZ19jb25uZWN0b3I7Cj4gLSAgICAgICAgICAgICAgICAgICAgICAgZHJtX2Nv
bm5lY3Rvcl9pbml0KGRldiwgJmFtZGdwdV9jb25uZWN0b3ItPmJhc2UsICZhbWRncHVfY29ubmVj
dG9yX2RwX2Z1bmNzLCBjb25uZWN0b3JfdHlwZSk7Cj4gLSAgICAgICAgICAgICAgICAgICAgICAg
ZHJtX2Nvbm5lY3Rvcl9oZWxwZXJfYWRkKCZhbWRncHVfY29ubmVjdG9yLT5iYXNlLCAmYW1kZ3B1
X2Nvbm5lY3Rvcl9kcF9oZWxwZXJfZnVuY3MpOwo+ICAgICAgICAgICAgICAgICAgICAgICAgIGlm
IChpMmNfYnVzLT52YWxpZCkgewo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYW1k
Z3B1X2Nvbm5lY3Rvci0+ZGRjX2J1cyA9IGFtZGdwdV9pMmNfbG9va3VwKGFkZXYsIGkyY19idXMp
Owo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaWYgKGFtZGdwdV9jb25uZWN0b3It
PmRkY19idXMpCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBpZiAoYW1kZ3B1X2Nv
bm5lY3Rvci0+ZGRjX2J1cykgewo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBoYXNfYXV4ID0gdHJ1ZTsKPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGVs
c2UKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZGRjID0gJmFtZGdw
dV9jb25uZWN0b3ItPmRkY19idXMtPmFkYXB0ZXI7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICB9IGVsc2Ugewo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBEUk1fRVJST1IoIkRQOiBGYWlsZWQgdG8gYXNzaWduIGRkYyBidXMhIENoZWNrIGRtZXNnIGZv
ciBpMmMgZXJyb3JzLlxuIik7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB9Cj4g
ICAgICAgICAgICAgICAgICAgICAgICAgfQo+ICsgICAgICAgICAgICAgICAgICAgICAgIGRybV9j
b25uZWN0b3JfaW5pdF93aXRoX2RkYyhkZXYsICZhbWRncHVfY29ubmVjdG9yLT5iYXNlLAo+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAmYW1kZ3B1
X2Nvbm5lY3Rvcl9kcF9mdW5jcywKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgY29ubmVjdG9yX3R5cGUsCj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGRkYyk7Cj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgZHJtX2Nvbm5lY3Rvcl9oZWxwZXJfYWRkKCZhbWRncHVfY29ubmVjdG9yLT5iYXNlLCAm
YW1kZ3B1X2Nvbm5lY3Rvcl9kcF9oZWxwZXJfZnVuY3MpOwo+ICAgICAgICAgICAgICAgICAgICAg
ICAgIHN1YnBpeGVsX29yZGVyID0gU3ViUGl4ZWxIb3Jpem9udGFsUkdCOwo+ICAgICAgICAgICAg
ICAgICAgICAgICAgIGRybV9vYmplY3RfYXR0YWNoX3Byb3BlcnR5KCZhbWRncHVfY29ubmVjdG9y
LT5iYXNlLmJhc2UsCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgYWRldi0+bW9kZV9pbmZvLmNvaGVyZW50X21vZGVfcHJvcGVydHksCj4gQEAg
LTE4MzgsMTUgKzE4NzIsMjAgQEAgYW1kZ3B1X2Nvbm5lY3Rvcl9hZGQoc3RydWN0IGFtZGdwdV9k
ZXZpY2UgKmFkZXYsCj4gICAgICAgICAgICAgICAgICAgICAgICAgaWYgKCFhbWRncHVfZGlnX2Nv
bm5lY3RvcikKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGdvdG8gZmFpbGVkOwo+
ICAgICAgICAgICAgICAgICAgICAgICAgIGFtZGdwdV9jb25uZWN0b3ItPmNvbl9wcml2ID0gYW1k
Z3B1X2RpZ19jb25uZWN0b3I7Cj4gLSAgICAgICAgICAgICAgICAgICAgICAgZHJtX2Nvbm5lY3Rv
cl9pbml0KGRldiwgJmFtZGdwdV9jb25uZWN0b3ItPmJhc2UsICZhbWRncHVfY29ubmVjdG9yX2Vk
cF9mdW5jcywgY29ubmVjdG9yX3R5cGUpOwo+IC0gICAgICAgICAgICAgICAgICAgICAgIGRybV9j
b25uZWN0b3JfaGVscGVyX2FkZCgmYW1kZ3B1X2Nvbm5lY3Rvci0+YmFzZSwgJmFtZGdwdV9jb25u
ZWN0b3JfZHBfaGVscGVyX2Z1bmNzKTsKPiAgICAgICAgICAgICAgICAgICAgICAgICBpZiAoaTJj
X2J1cy0+dmFsaWQpIHsKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGFtZGdwdV9j
b25uZWN0b3ItPmRkY19idXMgPSBhbWRncHVfaTJjX2xvb2t1cChhZGV2LCBpMmNfYnVzKTsKPiAt
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGlmIChhbWRncHVfY29ubmVjdG9yLT5kZGNf
YnVzKQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaWYgKGFtZGdwdV9jb25uZWN0
b3ItPmRkY19idXMpIHsKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
aGFzX2F1eCA9IHRydWU7Cj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBlbHNlCj4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGRkYyA9ICZhbWRncHVfY29u
bmVjdG9yLT5kZGNfYnVzLT5hZGFwdGVyOwo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgfSBlbHNlIHsKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgRFJN
X0VSUk9SKCJEUDogRmFpbGVkIHRvIGFzc2lnbiBkZGMgYnVzISBDaGVjayBkbWVzZyBmb3IgaTJj
IGVycm9ycy5cbiIpOwo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfQo+ICAgICAg
ICAgICAgICAgICAgICAgICAgIH0KPiArICAgICAgICAgICAgICAgICAgICAgICBkcm1fY29ubmVj
dG9yX2luaXRfd2l0aF9kZGMoZGV2LCAmYW1kZ3B1X2Nvbm5lY3Rvci0+YmFzZSwKPiArICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgJmFtZGdwdV9jb25u
ZWN0b3JfZWRwX2Z1bmNzLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBjb25uZWN0b3JfdHlwZSwKPiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgZGRjKTsKPiArICAgICAgICAgICAgICAgICAgICAg
ICBkcm1fY29ubmVjdG9yX2hlbHBlcl9hZGQoJmFtZGdwdV9jb25uZWN0b3ItPmJhc2UsICZhbWRn
cHVfY29ubmVjdG9yX2RwX2hlbHBlcl9mdW5jcyk7Cj4gICAgICAgICAgICAgICAgICAgICAgICAg
ZHJtX29iamVjdF9hdHRhY2hfcHJvcGVydHkoJmFtZGdwdV9jb25uZWN0b3ItPmJhc2UuYmFzZSwK
PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBk
ZXYtPm1vZGVfY29uZmlnLnNjYWxpbmdfbW9kZV9wcm9wZXJ0eSwKPiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBEUk1fTU9ERV9TQ0FMRV9GVUxM
U0NSRUVOKTsKPiBAQCAtMTg1OSwxMyArMTg5OCwxOCBAQCBhbWRncHVfY29ubmVjdG9yX2FkZChz
dHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwKPiAgICAgICAgICAgICAgICAgICAgICAgICBpZiAo
IWFtZGdwdV9kaWdfY29ubmVjdG9yKQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
Z290byBmYWlsZWQ7Cj4gICAgICAgICAgICAgICAgICAgICAgICAgYW1kZ3B1X2Nvbm5lY3Rvci0+
Y29uX3ByaXYgPSBhbWRncHVfZGlnX2Nvbm5lY3RvcjsKPiAtICAgICAgICAgICAgICAgICAgICAg
ICBkcm1fY29ubmVjdG9yX2luaXQoZGV2LCAmYW1kZ3B1X2Nvbm5lY3Rvci0+YmFzZSwgJmFtZGdw
dV9jb25uZWN0b3JfbHZkc19mdW5jcywgY29ubmVjdG9yX3R5cGUpOwo+IC0gICAgICAgICAgICAg
ICAgICAgICAgIGRybV9jb25uZWN0b3JfaGVscGVyX2FkZCgmYW1kZ3B1X2Nvbm5lY3Rvci0+YmFz
ZSwgJmFtZGdwdV9jb25uZWN0b3JfbHZkc19oZWxwZXJfZnVuY3MpOwo+ICAgICAgICAgICAgICAg
ICAgICAgICAgIGlmIChpMmNfYnVzLT52YWxpZCkgewo+ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgYW1kZ3B1X2Nvbm5lY3Rvci0+ZGRjX2J1cyA9IGFtZGdwdV9pMmNfbG9va3VwKGFk
ZXYsIGkyY19idXMpOwo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaWYgKCFhbWRn
cHVfY29ubmVjdG9yLT5kZGNfYnVzKQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBEUk1fRVJST1IoIkxWRFM6IEZhaWxlZCB0byBhc3NpZ24gZGRjIGJ1cyEgQ2hlY2sg
ZG1lc2cgZm9yIGkyYyBlcnJvcnMuXG4iKTsKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIGVsc2UKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZGRjID0g
JmFtZGdwdV9jb25uZWN0b3ItPmRkY19idXMtPmFkYXB0ZXI7Cj4gICAgICAgICAgICAgICAgICAg
ICAgICAgfQo+ICsgICAgICAgICAgICAgICAgICAgICAgIGRybV9jb25uZWN0b3JfaW5pdF93aXRo
X2RkYyhkZXYsICZhbWRncHVfY29ubmVjdG9yLT5iYXNlLAo+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAmYW1kZ3B1X2Nvbm5lY3Rvcl9sdmRzX2Z1
bmNzLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBjb25uZWN0b3JfdHlwZSwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgZGRjKTsKPiArICAgICAgICAgICAgICAgICAgICAgICBkcm1fY29ubmVj
dG9yX2hlbHBlcl9hZGQoJmFtZGdwdV9jb25uZWN0b3ItPmJhc2UsICZhbWRncHVfY29ubmVjdG9y
X2x2ZHNfaGVscGVyX2Z1bmNzKTsKPiAgICAgICAgICAgICAgICAgICAgICAgICBkcm1fb2JqZWN0
X2F0dGFjaF9wcm9wZXJ0eSgmYW1kZ3B1X2Nvbm5lY3Rvci0+YmFzZS5iYXNlLAo+ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGRldi0+bW9kZV9j
b25maWcuc2NhbGluZ19tb2RlX3Byb3BlcnR5LAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIERSTV9NT0RFX1NDQUxFX0ZVTExTQ1JFRU4pOwo+
IC0tCj4gMi4xNy4xCj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwo+IGFtZC1nZnggbWFpbGluZyBsaXN0Cj4gYW1kLWdmeEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ft
ZC1nZngKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1k
LWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
