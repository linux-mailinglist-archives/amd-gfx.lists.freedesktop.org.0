Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 129792B50BC
	for <lists+amd-gfx@lfdr.de>; Mon, 16 Nov 2020 20:18:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 064176E0C9;
	Mon, 16 Nov 2020 19:18:18 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0225D6E03B
 for <amd-gfx@lists.freedesktop.org>; Mon, 16 Nov 2020 17:34:03 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id j7so19618886wrp.3
 for <amd-gfx@lists.freedesktop.org>; Mon, 16 Nov 2020 09:34:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2rD08UjkD5sCRxYS0F4REDAlR1ogAYBAyad+KWz2GEw=;
 b=K3MiO7nmCnXKxJcjVRzgh23znPiMhQF02r4EEB7ilazh6Q3typAKfns3W275i/uPwe
 6ki3g+RVNhc0vrXZq3g/NjcHDWs+0dIiR9hbHYjXkWaHA19vmEOkeiL3NWGUAzyrgJkN
 tHQKXYzaVPK1Y726mGhFToAlmQJnLR0vrjWl/G6HFa2g8W8po3DfiLJSh4w3r3xm1/1J
 4iKvoDgtchsphx/S761VXUii48yJOE65It3vRJ8WDhCFz/WQHdhzXpPzR3iG+qQI4OXV
 Kn62IC/EEYXRvvO5sxXlSmdibfJONlvMFe2LSYETrMbq3r5KirnOZfjBqtRLpviug9+T
 jXxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2rD08UjkD5sCRxYS0F4REDAlR1ogAYBAyad+KWz2GEw=;
 b=TaYOFCKaw5XuDCoAL7sEipu1EhaKXdCfJHogoTxPwEfYCQvy4IVCTRvo7y5JFXvw3e
 inERSLtqQtYbJOn76J6U3z7eOrq0kCSH9lWZiDSlLOCjHL9RxJAJ5U1m5COMKAWWlDcG
 ruKJDxmw4/Gyrd7NX8qwkZHhE1AURfCqmrKeFMoGNFu9iF9FaRPHD9OoDVNGTF3pBacB
 OHx2fDC+dpNrtgqZBpa+8BGxotWtOwLieonP8oyJBF1IsJh8bAWaRBuK+3MyGN5l4J99
 E1JHsLsnKGXSLZRbO2W/G50VHz2OOkbe287NPz3j+fQqHfggpITjOkxzTejAfxYu2squ
 Cs8w==
X-Gm-Message-State: AOAM532keE/Ji0JNYDbgKqYVYCMi5KBE5E7IBHXcEFuzSV6dAONQ/u32
 Eqic0DvpAYU61yZiXnLmOttqXg==
X-Google-Smtp-Source: ABdhPJynz1SYzcQjLU7vxkWKnYKhsXRdyUFjnGlTNdA6hFZ/AU7rgprYiT7u0t+B4P+Sd63V1F7+RA==
X-Received: by 2002:adf:de12:: with SMTP id b18mr21161496wrm.187.1605548042617; 
 Mon, 16 Nov 2020 09:34:02 -0800 (PST)
Received: from dell.default ([91.110.221.159])
 by smtp.gmail.com with ESMTPSA id k22sm20178562wmi.34.2020.11.16.09.34.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2020 09:34:01 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [RESEND 00/42] Rid W=1 warnings from GPU (non-Radeon)
Date: Mon, 16 Nov 2020 17:33:14 +0000
Message-Id: <20201116173356.1828478-1-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 16 Nov 2020 19:18:13 +0000
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
Cc: =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Russell King <linux@armlinux.org.uk>, Eric Anholt <eric@anholt.net>,
 Huang Rui <ray.huang@amd.com>, Rob Clark <robdclark@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Chris Zhong <zyw@rock-chips.com>,
 Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 Ajay Kumar <ajaykumar.rs@samsung.com>, Jerome Brunet <jbrunet@baylibre.com>,
 linux-samsung-soc@vger.kernel.org, Eunchul Kim <chulspro.kim@samsung.com>,
 Joonyoung Shim <jy0922.shim@samsung.com>, Jie Qiu <jie.qiu@mediatek.com>,
 linux-rockchip@lists.infradead.org, Kevin Hilman <khilman@baylibre.com>,
 David Francis <David.Francis@amd.com>, NXP Linux Team <linux-imx@nxp.com>,
 amd-gfx@lists.freedesktop.org, Sumit Semwal <sumit.semwal@linaro.org>,
 Jinyoung Jeon <jy0.jeon@samsung.com>, Nickey Yang <nickey.yang@rock-chips.com>,
 Luben Tuikov <luben.tuikov@amd.com>, Ben Skeggs <bskeggs@redhat.com>,
 YT SHEN <yt.shen@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Nirmoy Das <nirmoy.aiemd@gmail.com>, linux-media@vger.kernel.org,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Inki Dae <inki.dae@samsung.com>,
 Akshu Agarwal <akshua@gmail.com>, Kalyan Thota <kalyan_t@codeaurora.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-amlogic@lists.infradead.org,
 Sean Paul <sean@poorly.run>, Sangmin Lee <lsmin.lee@samsung.com>,
 linux-arm-kernel@lists.infradead.org, Mark Yao <mark.yao@rock-chips.com>,
 linaro-mm-sig@lists.linaro.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Sandy Huang <hjc@rock-chips.com>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 linux-kernel@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>,
 Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>,
 linux-mediatek@lists.infradead.org, freedreno@lists.freedesktop.org,
 Christian Koenig <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VGhpcyBzZXQgY29udGFpbnMgZml4ZXMgZm9yIHNvbWUgIndvdWxkbid0IGl0IGJlIG5pY2UgaWYi
IGlzc3VlcywKaG93ZXZlciBtb3N0IG9mIHRoZSBwYXRjaGVzIHNlZW4gaGVyZSBoYXZlIGJlZW4g
b24gdGhlIE1McywgYnV0CndlcmUgbGVmdCB1bnJldmlld2VkLgoKTGVlIEpvbmVzICg0Mik6CiAg
ZHJtL2FtZC9hbWRncHUvYXRvbWJpb3NfZW5jb2RlcnM6IFJlbW92ZSBzZXQgYnV0IHVudXNlZCB2
YXJpYWJsZQogICAgJ2JhY2tsaWdodF9sZXZlbCcKICBkcm0vYXJtYWRhL2FybWFkYV9vdmVybGF5
OiBTdGF0aWNpZnkgbG9jYWwgZnVuY3Rpb24KICAgICdhcm1hZGFfb3ZlcmxheV9kdXBsaWNhdGVf
c3RhdGUnCiAgZHJtL2RybV9kcF9tc3RfdG9wb2xvZ3k6IFJlbW92ZSBzZXQgYnV0IG5ldmVyIHVz
ZWQgdmFyaWFibGUgJ2xlbicKICBkcm0vZXh5bm9zL2V4eW5vczdfZHJtX2RlY29uOiBTdXBwbHkg
bWlzc2luZyBkZXNjcmlwdGlvbiBmb3IgIHBhcmFtCiAgICAnY3R4JwogIGRybS9leHlub3MvZXh5
bm9zX2RybV9maW1kOiBBZGQgbWlzc2luZyBkZXNjcmlwdGlvbiBmb3IgcGFyYW0gJ2N0eCcKICBk
cm0vZXh5bm9zL2V4eW5vc19kcm1fZ3NjOiBTdXBwbHkgbWlzc2luZyBkZXNjcmlwdGlvbiBmb3Ig
J251bV9saW1pdHMnCiAgZHJtL21lZGlhdGVrL210a19kcGk6IFJlbW92ZSB1bnVzZWQgc3RydWN0
IGRlZmluaXRpb24KICAgICdtdGtfZHBpX2VuY29kZXJfZnVuY3MnCiAgZHJtL21lZGlhdGVrL210
a19kaXNwX2NvbG9yOiBGaXggZm9ybWF0dGluZyBhbmQgcHJvdmlkZSBtaXNzaW5nIG1lbWJlcgog
ICAgZGVzY3JpcHRpb24KICBkcm0vbWVkaWF0ZWsvbXRrX2Rpc3Bfb3ZsOiBGaXggZm9ybWF0dGlu
ZyBhbmQgcHJvdmlkZSBtaXNzaW5nIG1lbWJlcgogICAgZGVzY3JpcHRpb24KICBkcm0vbWVkaWF0
ZWsvbXRrX2Rpc3BfcmRtYTogRml4IGZvcm1hdHRpbmcgYW5kIHN1cHBseSBtaXNzaW5nIHN0cnVj
dAogICAgbWVtYmVyIGRlc2NyaXB0aW9uCiAgZHJtL21lZGlhdGVrL210a19kcm1fY3J0YzogRGVt
b3RlIHNlcmlvdXNseSBvdXQtb2YtZGF0ZSBzdHJ1Y3QgaGVhZGVyCiAgZHJtL21lZGlhdGVrL210
a19kcm1fZHJ2OiBTdGF0aWNpc2UgbG9jYWwgZnVuY3Rpb24gaW52b2tlZCBieQogICAgcmVmZXJl
bmNlCiAgZHJtL21lc29uL21lc29uX3ZlbmM6IE1ha2UgbG9jYWwgZnVuY3Rpb24KICAgICdtZXNv
bl92ZW5jX2hkbWlfZ2V0X2RtdF92bW9kZScgc3RhdGljCiAgZHJtL21lc29uL21lc29uX3ZjbGs6
IE1ha2UgdHdvIGxvY2FsIGZ1bmN0aW9ucyBzdGF0aWMKICBkcm0vbXNtL2FkcmVuby9hNnh4X2dw
dTogU3RhdGljaXNlIGxvY2FsIGZ1bmN0aW9uICdhNnh4X2lkbGUnCiAgZHJtL21zbS9kaXNwL21k
cDUvbWRwNV9jcnRjOiBNYWtlIGxvY2FsIGZ1bmN0aW9uCiAgICAnbWRwNV9jcnRjX3NldHVwX3Bp
cGVsaW5lKCknIHN0YXRpYwogIGRybS9tc20vZGlzcC9tZHA1L21kcDVfY3RsOiBEZW1vdGUgbm9u
LWNvbmZvcm1hbnQga2VybmVsLWRvYyBoZWFkZXJzCiAgZHJtL21zbS9kaXNwL21kcDUvbWRwNV9r
bXM6IE1ha2UgbG9jYWwgZnVuY3Rpb25zICdtZHA1X3tlbixkaXN9YWJsZSgpJwogICAgc3RhdGlj
CiAgZHJtL21zbS9kaXNwL2RwdTEvZHB1X2NvcmVfcGVyZjogUmVtb3ZlIHNldCBidXQgdW51c2Vk
IHZhcmlhYmxlCiAgICAnZHB1X2NzdGF0ZScKICBkcm0vbXNtL2Rpc3AvZHB1MS9kcHVfZW5jb2Rl
cjogUmVtb3ZlIGEgYnVuY2ggb2YgdW51c2VkIHZhcmlhYmxlcwogIGRybS9ub3V2ZWF1L252a20v
Y29yZS9maXJtd2FyZTogRml4IGZvcm1hdHRpbmcsIHByb3ZpZGUgbWlzc2luZyBwYXJhbQogICAg
ZGVzY3JpcHRpb24KICBkcm0vcGwxMTEvcGwxMTFfZGlzcGxheTogTWFrZSBsb2NhbCBmdW5jdGlv
biBzdGF0aWMKICBkcm0vcGwxMTEvcGwxMTFfZGVidWdmczogTWFrZSBsb2NhbCBmdW5jdGlvbiAn
cGwxMTFfZGVidWdmc19yZWdzKCknCiAgICBzdGF0aWMKICBkcm0vcm9ja2NoaXAvZHctbWlwaS1k
c2ktcm9ja2NoaXA6IERlbW90ZSBub24tY29uZm9ybWFudCBrZXJuZWwtZG9jCiAgICBoZWFkZXJz
CiAgZHJtL3JvY2tjaGlwL3JvY2tjaGlwX3JnYjogQ29uc3VtZSBvdXIgb3duIGhlYWRlcgogIGRy
bS9yb2NrY2hpcC9yb2NrY2hpcF9sdmRzOiBGaXggc3RydWN0IGRvY3VtZW50IGZvcm1hdHRpbmcK
ICBkcm0vc2VsZnRlc3RzL3Rlc3QtZHJtX21tOiBNYXJrICdob2xlX2VuZCcgYXMgYWx3YXlzX3Vu
dXNlZAogIGRybS9zZWxmdGVzdHMvdGVzdC1kcm1fZnJhbWVidWZmZXI6IFJlbW92ZSBzZXQgYnV0
IHVudXNlZCB2YXJpYWJsZQogICAgJ2ZiJwogIGRybS9zZWxmdGVzdHMvdGVzdC1kcm1fZHBfbXN0
X2hlbHBlcjogUGxhY2UgJ3N0cnVjdAogICAgZHJtX2RwX3NpZGViYW5kX21zZ19yZXFfYm9keScg
b250byB0aGUgaGVhcAogIGRybS9zZWxmdGVzdHMvdGVzdC1kcm1fZHBfbXN0X2hlbHBlcjogTW92
ZQogICAgJ3NpZGViYW5kX21zZ19yZXFfZW5jb2RlX2RlY29kZScgb250byB0aGUgaGVhcAogIGRy
bS90dG0vdHRtX2JvOiBGaXggb25lIGZ1bmN0aW9uIGhlYWRlciAtIGRlbW90ZSBsb3RzIG9mIGtl
cm5lbC1kb2MKICAgIGFidXNlcwogIGRybS90dG0vdHRtX3R0OiBEZW1vdGUga2VybmVsLWRvYyBo
ZWFkZXIgZm9ybWF0IGFidXNlcwogIGRybS90dG0vdHRtX3JhbmdlX21hbmFnZXI6IERlbW90ZSBu
b24tY29uZm9ybWFudCBrZXJuZWwtZG9jIGhlYWRlcgogIGRybS92M2QvdjNkX2RydjogUmVtb3Zl
IHVudXNlZCBzdGF0aWMgdmFyaWFibGUgJ3YzZF92M2RfcG1fb3BzJwogIGRybS92M2QvdjNkX2dl
bTogUHJvdmlkZSBkZXNjcmlwdGlvbnMgZm9yICd2M2RfbG9va3VwX2JvcydzIHBhcmFtcwogIGRy
bS92M2QvdjNkX3NjaGVkOiBEZW1vdGUgbm9uLWNvbmZvcm1hbnQga2VybmVsLWRvYyBoZWFkZXIK
ICBkcm0vdmM0L3ZjNF9oZG1pX3JlZ3M6IE1hcmsgc29tZSBkYXRhIHNldHMgYXMgX19tYXliZV91
bnVzZWQKICBkcm0vdmM0L3ZjNF9oZG1pOiBSZW1vdmUgc2V0IGJ1dCB1bnVzZWQgdmFyaWFibGUg
J3JldCcKICBkcm0vdmM0L3ZjNF92M2Q6IERlbW90ZSBub24tY29uZm9ybWFudCBrZXJuZWwtZG9j
IGhlYWRlcnMKICBkcm0vdmM0L3ZjNF9kZWJ1Z2ZzOiBEZW1vdGUgbm9uLWNvbmZvcm1hbnQga2Vy
bmVsLWRvYyBoZWFkZXJzCiAgZ3B1L2lwdS12My9pcHUtZGk6IFN0cmlwIG91dCAyIHVudXNlZCAn
ZGlfc3luY19jb25maWcnIGVudHJpZXMKICBpbmNsdWRlL2RybS9kcm1fYXRvbWljOiBNYWtlIHVz
ZSBvZiAnbmV3X2NydGNfc3RhdGUnCgogLi4uL2dwdS9kcm0vYW1kL2FtZGdwdS9hdG9tYmlvc19l
bmNvZGVycy5jICAgIHwgIDMgLS0KIGRyaXZlcnMvZ3B1L2RybS9hcm1hZGEvYXJtYWRhX292ZXJs
YXkuYyAgICAgICB8ICAyICstCiBkcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5j
ICAgICAgICAgfCAgNCArLQogZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3M3X2RybV9kZWNv
bi5jICAgIHwgIDEgKwogZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfZHJtX2ZpbWQuYyAg
ICAgIHwgIDEgKwogZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfZHJtX2dzYy5jICAgICAg
IHwgIDEgKwogZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX2NvbG9yLmMgICAgIHwg
IDUgKystCiBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3Bfb3ZsLmMgICAgICAgfCAg
NSArKy0KIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9yZG1hLmMgICAgICB8ICA1
ICsrLQogZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcGkuYyAgICAgICAgICAgIHwgIDkg
LS0tLS0KIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2NydGMuYyAgICAgICB8ICA0
ICstCiBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kcnYuYyAgICAgICAgfCAgNCAr
LQogZHJpdmVycy9ncHUvZHJtL21lc29uL21lc29uX3ZjbGsuYyAgICAgICAgICAgIHwgIDggKyst
LQogZHJpdmVycy9ncHUvZHJtL21lc29uL21lc29uX3ZlbmMuYyAgICAgICAgICAgIHwgIDQgKy0K
IGRyaXZlcnMvZ3B1L2RybS9tc20vYWRyZW5vL2E2eHhfZ3B1LmMgICAgICAgICB8ICAyICstCiBk
cml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvZHB1MS9kcHVfY29yZV9wZXJmLmMgfCAgMyAtLQogZHJp
dmVycy9ncHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X2VuY29kZXIuYyAgIHwgMTIgKy0tLS0tCiBk
cml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvbWRwNS9tZHA1X2NydGMuYyAgICAgfCAgNiArLS0KIGRy
aXZlcnMvZ3B1L2RybS9tc20vZGlzcC9tZHA1L21kcDVfY3RsLmMgICAgICB8ICA2ICstLQogZHJp
dmVycy9ncHUvZHJtL21zbS9kaXNwL21kcDUvbWRwNV9rbXMuYyAgICAgIHwgIDQgKy0KIGRyaXZl
cnMvZ3B1L2RybS9ub3V2ZWF1L252a20vY29yZS9maXJtd2FyZS5jICB8ICA5ICsrKy0tCiBkcml2
ZXJzL2dwdS9kcm0vcGwxMTEvcGwxMTFfZGVidWdmcy5jICAgICAgICAgfCAgMiArLQogZHJpdmVy
cy9ncHUvZHJtL3BsMTExL3BsMTExX2Rpc3BsYXkuYyAgICAgICAgIHwgIDIgKy0KIC4uLi9ncHUv
ZHJtL3JvY2tjaGlwL2R3LW1pcGktZHNpLXJvY2tjaGlwLmMgICB8ICA0ICstCiBkcml2ZXJzL2dw
dS9kcm0vcm9ja2NoaXAvcm9ja2NoaXBfbHZkcy5jICAgICAgfCAgMiArLQogZHJpdmVycy9ncHUv
ZHJtL3JvY2tjaGlwL3JvY2tjaGlwX3JnYi5jICAgICAgIHwgIDEgKwogLi4uL2RybS9zZWxmdGVz
dHMvdGVzdC1kcm1fZHBfbXN0X2hlbHBlci5jICAgIHwgNDAgKysrKysrKysrKysrKy0tLS0tLQog
Li4uL2dwdS9kcm0vc2VsZnRlc3RzL3Rlc3QtZHJtX2ZyYW1lYnVmZmVyLmMgIHwgIDMgKy0KIGRy
aXZlcnMvZ3B1L2RybS9zZWxmdGVzdHMvdGVzdC1kcm1fbW0uYyAgICAgICB8ICAyICstCiBkcml2
ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jICAgICAgICAgICAgICAgICAgfCAyMyArKysrKystLS0t
LQogZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fcmFuZ2VfbWFuYWdlci5jICAgICAgIHwgIDIgKy0K
IGRyaXZlcnMvZ3B1L2RybS90dG0vdHRtX3R0LmMgICAgICAgICAgICAgICAgICB8ICA0ICstCiBk
cml2ZXJzL2dwdS9kcm0vdjNkL3YzZF9kcnYuYyAgICAgICAgICAgICAgICAgfCAzNiAtLS0tLS0t
LS0tLS0tLS0tLQogZHJpdmVycy9ncHUvZHJtL3YzZC92M2RfZ2VtLmMgICAgICAgICAgICAgICAg
IHwgIDIgKwogZHJpdmVycy9ncHUvZHJtL3YzZC92M2Rfc2NoZWQuYyAgICAgICAgICAgICAgIHwg
IDIgKy0KIGRyaXZlcnMvZ3B1L2RybS92YzQvdmM0X2RlYnVnZnMuYyAgICAgICAgICAgICB8ICA0
ICstCiBkcml2ZXJzL2dwdS9kcm0vdmM0L3ZjNF9oZG1pLmMgICAgICAgICAgICAgICAgfCAgMyAr
LQogZHJpdmVycy9ncHUvZHJtL3ZjNC92YzRfaGRtaV9yZWdzLmggICAgICAgICAgIHwgIDYgKy0t
CiBkcml2ZXJzL2dwdS9kcm0vdmM0L3ZjNF92M2QuYyAgICAgICAgICAgICAgICAgfCAgNCArLQog
ZHJpdmVycy9ncHUvaXB1LXYzL2lwdS1kaS5jICAgICAgICAgICAgICAgICAgIHwgIDQgLS0KIGlu
Y2x1ZGUvZHJtL2RybV9hdG9taWMuaCAgICAgICAgICAgICAgICAgICAgICB8ICAzICstCiA0MSBm
aWxlcyBjaGFuZ2VkLCAxMDUgaW5zZXJ0aW9ucygrKSwgMTQyIGRlbGV0aW9ucygtKQoKQ2M6IEFq
YXkgS3VtYXIgPGFqYXlrdW1hci5yc0BzYW1zdW5nLmNvbT4KQ2M6IEFrc2h1IEFnYXJ3YWwgPGFr
c2h1YUBnbWFpbC5jb20+CkNjOiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5j
b20+CkNjOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpDYzogQmVuIFNrZWdncyA8YnNr
ZWdnc0ByZWRoYXQuY29tPgpDYzogQ2hyaXN0aWFuIEtvZW5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0Bh
bWQuY29tPgpDYzogIkNocmlzdGlhbiBLw7ZuaWciIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+
CkNjOiBDaHJpcyBaaG9uZyA8enl3QHJvY2stY2hpcHMuY29tPgpDYzogQ2h1bi1LdWFuZyBIdSA8
Y2h1bmt1YW5nLmh1QGtlcm5lbC5vcmc+CkNjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwu
Y2g+CkNjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+CkNjOiBEYXZpZCBGcmFuY2lz
IDxEYXZpZC5GcmFuY2lzQGFtZC5jb20+CkNjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCkNjOiBFcmljIEFuaG9sdCA8ZXJpY0BhbmhvbHQubmV0PgpDYzogRXVuY2h1bCBLaW0gPGNo
dWxzcHJvLmtpbUBzYW1zdW5nLmNvbT4KQ2M6IEZhYmlvIEVzdGV2YW0gPGZlc3RldmFtQGdtYWls
LmNvbT4KQ2M6IGZyZWVkcmVub0BsaXN0cy5mcmVlZGVza3RvcC5vcmcKQ2M6ICJIZWlrbyBTdMO8
Ym5lciIgPGhlaWtvQHNudGVjaC5kZT4KQ2M6IEh1YW5nIFJ1aSA8cmF5Lmh1YW5nQGFtZC5jb20+
CkNjOiBJbmtpIERhZSA8aW5raS5kYWVAc2Ftc3VuZy5jb20+CkNjOiBKZXJvbWUgQnJ1bmV0IDxq
YnJ1bmV0QGJheWxpYnJlLmNvbT4KQ2M6IEppZSBRaXUgPGppZS5xaXVAbWVkaWF0ZWsuY29tPgpD
YzogSmlueW91bmcgSmVvbiA8ankwLmplb25Ac2Ftc3VuZy5jb20+CkNjOiBKb29ueW91bmcgU2hp
bSA8ankwOTIyLnNoaW1Ac2Ftc3VuZy5jb20+CkNjOiBLYWx5YW4gVGhvdGEgPGthbHlhbl90QGNv
ZGVhdXJvcmEub3JnPgpDYzogS2V2aW4gSGlsbWFuIDxraGlsbWFuQGJheWxpYnJlLmNvbT4KQ2M6
IEtyenlzenRvZiBLb3psb3dza2kgPGtyemtAa2VybmVsLm9yZz4KQ2M6IEt5dW5nbWluIFBhcmsg
PGt5dW5nbWluLnBhcmtAc2Ftc3VuZy5jb20+CkNjOiBsaW5hcm8tbW0tc2lnQGxpc3RzLmxpbmFy
by5vcmcKQ2M6IGxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpDYzogbGludXgtYXJt
LWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCkNjOiBsaW51eC1hcm0tbXNtQHZnZXIua2VybmVs
Lm9yZwpDYzogbGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpDYzogbGludXgtbWVk
aWFAdmdlci5rZXJuZWwub3JnCkNjOiBsaW51eC1yb2NrY2hpcEBsaXN0cy5pbmZyYWRlYWQub3Jn
CkNjOiBsaW51eC1zYW1zdW5nLXNvY0B2Z2VyLmtlcm5lbC5vcmcKQ2M6IEx1YmVuIFR1aWtvdiA8
bHViZW4udHVpa292QGFtZC5jb20+CkNjOiBMeXVkZSBQYXVsIDxseXVkZUByZWRoYXQuY29tPgpD
YzogTWFhcnRlbiBMYW5raG9yc3QgPG1hYXJ0ZW4ubGFua2hvcnN0QGxpbnV4LmludGVsLmNvbT4K
Q2M6IE1hcmsgWWFvIDxtYXJrLnlhb0Byb2NrLWNoaXBzLmNvbT4KQ2M6IE1hcnRpbiBCbHVtZW5z
dGluZ2wgPG1hcnRpbi5ibHVtZW5zdGluZ2xAZ29vZ2xlbWFpbC5jb20+CkNjOiBNYXR0aGlhcyBC
cnVnZ2VyIDxtYXR0aGlhcy5iZ2dAZ21haWwuY29tPgpDYzogTWF4aW1lIFJpcGFyZCA8bXJpcGFy
ZEBrZXJuZWwub3JnPgpDYzogTmVpbCBBcm1zdHJvbmcgPG5hcm1zdHJvbmdAYmF5bGlicmUuY29t
PgpDYzogTmlja2V5IFlhbmcgPG5pY2tleS55YW5nQHJvY2stY2hpcHMuY29tPgpDYzogTmlybW95
IERhcyA8bmlybW95LmFpZW1kQGdtYWlsLmNvbT4KQ2M6IG5vdXZlYXVAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCkNjOiBOWFAgTGludXggVGVhbSA8bGludXgtaW14QG54cC5jb20+CkNjOiBQZW5ndXRy
b25peCBLZXJuZWwgVGVhbSA8a2VybmVsQHBlbmd1dHJvbml4LmRlPgpDYzogUGhpbGlwcCBaYWJl
bCA8cC56YWJlbEBwZW5ndXRyb25peC5kZT4KQ2M6IFJvYiBDbGFyayA8cm9iZGNsYXJrQGdtYWls
LmNvbT4KQ2M6IFJ1c3NlbGwgS2luZyA8bGludXhAYXJtbGludXgub3JnLnVrPgpDYzogU2FuZHkg
SHVhbmcgPGhqY0Byb2NrLWNoaXBzLmNvbT4KQ2M6IFNhbmdtaW4gTGVlIDxsc21pbi5sZWVAc2Ft
c3VuZy5jb20+CkNjOiBTYXNjaGEgSGF1ZXIgPHMuaGF1ZXJAcGVuZ3V0cm9uaXguZGU+CkNjOiBT
ZWFuIFBhdWwgPHNlYW5AcG9vcmx5LnJ1bj4KQ2M6IFNldW5nLVdvbyBLaW0gPHN3MDMxMi5raW1A
c2Ftc3VuZy5jb20+CkNjOiBTaGF3biBHdW8gPHNoYXduZ3VvQGtlcm5lbC5vcmc+CkNjOiBTdW1p
dCBTZW13YWwgPHN1bWl0LnNlbXdhbEBsaW5hcm8ub3JnPgpDYzogVGhvbWFzIFppbW1lcm1hbm4g
PHR6aW1tZXJtYW5uQHN1c2UuZGU+CkNjOiBZVCBTSEVOIDx5dC5zaGVuQG1lZGlhdGVrLmNvbT4K
LS0gCjIuMjUuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4Cg==
