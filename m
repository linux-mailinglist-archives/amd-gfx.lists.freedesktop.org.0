Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B8E369D663
	for <lists+amd-gfx@lfdr.de>; Mon, 26 Aug 2019 21:26:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04FF86E2AC;
	Mon, 26 Aug 2019 19:26:17 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDA916E2A9;
 Mon, 26 Aug 2019 19:26:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: andrzej.p) with ESMTPSA id 7240A283D3B
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH RESEND 00/14] Next round of associating ddc adapters with
 connectors
Date: Mon, 26 Aug 2019 21:25:42 +0200
Message-Id: <cover.1566845537.git.andrzej.p@collabora.com>
X-Mailer: git-send-email 2.17.1
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
Cc: =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Ramalingam C <ramalingam.c@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 Andrzej Hajda <a.hajda@samsung.com>, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, kernel@collabora.com,
 Anthony Koo <Anthony.Koo@amd.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Emil Velikov <emil.velikov@collabora.com>,
 "David \(ChunMing\) Zhou" <David1.Zhou@amd.com>,
 Mario Kleiner <mario.kleiner.de@gmail.com>, linux-samsung-soc@vger.kernel.org,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, David Francis <David.Francis@amd.com>,
 Rob Clark <robdclark@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, linux-rockchip@lists.infradead.org,
 Kukjin Kim <kgene@kernel.org>, linux-arm-msm@vger.kernel.org,
 CK Hu <ck.hu@mediatek.com>, Harry Wentland <harry.wentland@amd.com>,
 Shashank Sharma <shashank.sharma@intel.com>, linux-tegra@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>, Jonas Karlman <jonas@kwiboo.se>,
 Leo Li <sunpeng.li@amd.com>, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, Inki Dae <inki.dae@samsung.com>,
 Mamta Shukla <mamtashukla555@gmail.com>, linux-mediatek@lists.infradead.org,
 Jyri Sarha <jsarha@ti.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, Sean Paul <sean@poorly.run>,
 linux-arm-kernel@lists.infradead.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 amd-gfx@lists.freedesktop.org, Eric Anholt <eric@anholt.net>,
 freedreno@lists.freedesktop.org, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Sandy Huang <hjc@rock-chips.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Todor Tomov <todor.tomov@linaro.org>,
 Kyungmin Park <kyungmin.park@samsung.com>, Daniel Vetter <daniel@ffwll.ch>,
 Alex Deucher <alexander.deucher@amd.com>, Shawn Guo <shawnguo@kernel.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

SSdtIHJlc2VuZGluZyB0aGUgcGF0Y2hlcyB3aGljaCBoYXZlIHNvbWVob3cgZ290IGxvc3Q6IG9u
ZSBwYXRjaApmcm9tIEdlZXJ0IGFuZCAxMyBwYXRjaGVzIGZyb20gbWUuCgpHZWVydCdzIHBhdGNo
IHVwZGF0ZXMgdGhlIGVycm9yIG1lc3NhZ2UgdG8gcmVmbGVjdCB0aGUgYWN0dWFsbHkKY2FsbGVk
IGZ1bmN0aW9uJ3MgbmFtZS4KCk1vc3Qgb2YgcGF0Y2hlcyBmcm9tIG1lIGhhdmUgdGhlaXIgQWNr
ZWQtYnkgYW5kIFJldmlld2VkLWJ5IHRhZ3MKYW5kIGRlYWwgd2l0aCBwcm92aWRpbmcgYSBkZGMg
c3ltbGluayBpbiBjb25uZWN0b3IncyBzeXNmcyBkaXJlY3RvcnkuCgpSZWJhc2VkIG9udG8gZHJt
LW1pc2MtbmV4dCBhcyBvZiAyNnRoIEF1Z3VzdC4KCkFuZHJ6ZWogUGlldHJhc2lld2ljeiAoMTMp
OgogIGRybS9yYWRlb246IFByb3ZpZGUgZGRjIHN5bWxpbmsgaW4gY29ubmVjdG9yIHN5c2ZzIGRp
cmVjdG9yeQogIGRybS9hbWRncHU6IFByb3ZpZGUgZGRjIHN5bWxpbmsgaW4gZG0gY29ubmVjdG9y
J3Mgc3lzZnMgZGlyZWN0b3J5CiAgZHJtL2V4eW5vczogUHJvdmlkZSBkZGMgc3ltbGluayBpbiBj
b25uZWN0b3IncyBzeXNmcwogIGRybTogcm9ja2NoaXA6IFByb3ZpZGUgZGRjIHN5bWxpbmsgaW4g
cmszMDY2X2hkbWkgc3lzZnMgZGlyZWN0b3J5CiAgZHJtOiByb2NrY2hpcDogUHJvdmlkZSBkZGMg
c3ltbGluayBpbiBpbm5vX2hkbWkgc3lzZnMgZGlyZWN0b3J5CiAgZHJtL21zbS9oZG1pOiBQcm92
aWRlIGRkYyBzeW1saW5rIGluIGhkbWkgY29ubmVjdG9yIHN5c2ZzIGRpcmVjdG9yeQogIGRybS9t
ZWRpYXRlazogUHJvdmlkZSBkZGMgc3ltbGluayBpbiBoZG1pIGNvbm5lY3RvciBzeXNmcyBkaXJl
Y3RvcnkKICBkcm0vdGVncmE6IFByb3ZpZGUgZGRjIHN5bWxpbmsgaW4gb3V0cHV0IGNvbm5lY3Rv
ciBzeXNmcyBkaXJlY3RvcnkKICBkcm0vdmM0OiBQcm92aWRlIGRkYyBzeW1saW5rIGluIGNvbm5l
Y3RvciBzeXNmcyBkaXJlY3RvcnkKICBkcm06IHp0ZTogUHJvdmlkZSBkZGMgc3ltbGluayBpbiBo
ZG1pIGNvbm5lY3RvciBzeXNmcyBkaXJlY3RvcnkKICBkcm06IHp0ZTogUHJvdmlkZSBkZGMgc3lt
bGluayBpbiB2Z2EgY29ubmVjdG9yIHN5c2ZzIGRpcmVjdG9yeQogIGRybS90aWxjZGM6IFByb3Zp
ZGUgZGRjIHN5bWxpbmsgaW4gY29ubmVjdG9yIHN5c2ZzIGRpcmVjdG9yeQogIGRybS9pOTE1OiBQ
cm92aWRlIGRkYyBzeW1saW5rIGluIGhkbWkgY29ubmVjdG9yIHN5c2ZzIGRpcmVjdG9yeQoKR2Vl
cnQgVXl0dGVyaG9ldmVuICgxKToKICBkcm0vYnJpZGdlOiB0aS10ZnA0MTA6IFVwZGF0ZSBkcm1f
Y29ubmVjdG9yX2luaXRfd2l0aF9kZGMoKSBlcnJvcgogICAgbWVzc2FnZQoKIC4uLi9ncHUvZHJt
L2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYyB8ICAgNSArLQogZHJpdmVycy9ncHUv
ZHJtL2JyaWRnZS90aS10ZnA0MTAuYyAgICAgICAgICAgIHwgICAzICstCiBkcml2ZXJzL2dwdS9k
cm0vZXh5bm9zL2V4eW5vc19oZG1pLmMgICAgICAgICAgfCAgIDYgKy0KIGRyaXZlcnMvZ3B1L2Ry
bS9pOTE1L2Rpc3BsYXkvaW50ZWxfaGRtaS5jICAgICB8ICAxMiArLQogZHJpdmVycy9ncHUvZHJt
L21lZGlhdGVrL210a19oZG1pLmMgICAgICAgICAgIHwgICA3ICstCiBkcml2ZXJzL2dwdS9kcm0v
bXNtL2hkbWkvaGRtaV9jb25uZWN0b3IuYyAgICAgfCAgIDYgKy0KIGRyaXZlcnMvZ3B1L2RybS9y
YWRlb24vcmFkZW9uX2Nvbm5lY3RvcnMuYyAgICB8IDE0MyArKysrKysrKysrKysrLS0tLS0KIGRy
aXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9pbm5vX2hkbWkuYyAgICAgICAgICB8ICAgNiArLQogZHJp
dmVycy9ncHUvZHJtL3JvY2tjaGlwL3JrMzA2Nl9oZG1pLmMgICAgICAgIHwgICA3ICstCiBkcml2
ZXJzL2dwdS9kcm0vdGVncmEvaGRtaS5jICAgICAgICAgICAgICAgICAgfCAgIDcgKy0KIGRyaXZl
cnMvZ3B1L2RybS90ZWdyYS9zb3IuYyAgICAgICAgICAgICAgICAgICB8ICAgNyArLQogZHJpdmVy
cy9ncHUvZHJtL3RpbGNkYy90aWxjZGNfdGZwNDEwLmMgICAgICAgIHwgICA2ICstCiBkcml2ZXJz
L2dwdS9kcm0vdmM0L3ZjNF9oZG1pLmMgICAgICAgICAgICAgICAgfCAgMTIgKy0KIGRyaXZlcnMv
Z3B1L2RybS96dGUvenhfaGRtaS5jICAgICAgICAgICAgICAgICB8ICAgNiArLQogZHJpdmVycy9n
cHUvZHJtL3p0ZS96eF92Z2EuYyAgICAgICAgICAgICAgICAgIHwgICA2ICstCiAxNSBmaWxlcyBj
aGFuZ2VkLCAxNjggaW5zZXJ0aW9ucygrKSwgNzEgZGVsZXRpb25zKC0pCgotLSAKMi4xNy4xCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1h
aWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
