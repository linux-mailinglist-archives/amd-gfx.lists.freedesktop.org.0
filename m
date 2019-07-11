Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3656165528
	for <lists+amd-gfx@lfdr.de>; Thu, 11 Jul 2019 13:27:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 072D56E184;
	Thu, 11 Jul 2019 11:27:14 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EA6E6E182;
 Thu, 11 Jul 2019 11:27:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: andrzej.p) with ESMTPSA id 8925A28B554
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 00/23] Associate ddc adapters with connectors
Date: Thu, 11 Jul 2019 13:26:27 +0200
Message-Id: <cover.1562843413.git.andrzej.p@collabora.com>
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
Cc: "Y.C. Chen" <yc_chen@aspeedtech.com>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 Sam Ravnborg <sam@ravnborg.org>, Neil Armstrong <narmstrong@baylibre.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Ramalingam C <ramalingam.c@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Douglas Anderson <dianders@chromium.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>, kernel@collabora.com,
 Fabio Estevam <festevam@gmail.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 "David \(ChunMing\) Zhou" <David1.Zhou@amd.com>,
 linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Vincent Abriou <vincent.abriou@st.com>, Rob Clark <robdclark@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
 David Airlie <airlied@linux.ie>, Chen-Yu Tsai <wens@csie.org>,
 Kukjin Kim <kgene@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
 CK Hu <ck.hu@mediatek.com>, Dave Airlie <airlied@redhat.com>,
 Harry Wentland <harry.wentland@amd.com>, intel-gfx@lists.freedesktop.org,
 Shashank Sharma <shashank.sharma@intel.com>, freedreno@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
 Jonas Karlman <jonas@kwiboo.se>, linux-arm-msm@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, Inki Dae <inki.dae@samsung.com>,
 Mamta Shukla <mamtashukla555@gmail.com>, linux-mediatek@lists.infradead.org,
 Jyri Sarha <jsarha@ti.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, Chris Wilson <chris@chris-wilson.co.uk>,
 Sean Paul <sean@poorly.run>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 amd-gfx@lists.freedesktop.org, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Eric Anholt <eric@anholt.net>, Thomas Zimmermann <tzimmermann@suse.de>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, Sandy Huang <hjc@rock-chips.com>,
 linux-kernel@vger.kernel.org, Todor Tomov <todor.tomov@linaro.org>,
 Kyungmin Park <kyungmin.park@samsung.com>, Huang Rui <ray.huang@amd.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Alex Deucher <alexander.deucher@amd.com>, Shawn Guo <shawnguo@kernel.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Gerd Hoffmann <kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

SXQgaXMgZGlmZmljdWx0IGZvciBhIHVzZXIgdG8ga25vdyB3aGljaCBvZiB0aGUgaTJjIGFkYXB0
ZXJzIGlzIGZvciB3aGljaApkcm0gY29ubmVjdG9yLiBUaGlzIHNlcmllcyBhZGRyZXNzZXMgdGhp
cyBwcm9ibGVtLgoKVGhlIGlkZWEgaXMgdG8gaGF2ZSBhIHN5bWJvbGljIGxpbmsgaW4gY29ubmVj
dG9yJ3Mgc3lzZnMgZGlyZWN0b3J5LCBlLmcuOgoKbHMgLWwgL3N5cy9jbGFzcy9kcm0vY2FyZDAt
SERNSS1BLTEvZGRjCmxyd3hyd3hyd3ggMSByb290IHJvb3QgMCBKdW4gMjQgMTA6NDIgL3N5cy9j
bGFzcy9kcm0vY2FyZDAtSERNSS1BLTEvZGRjIFwKCS0+IC4uLy4uLy4uLy4uL3NvYy8xMzg4MDAw
MC5pMmMvaTJjLTIKClRoZSB1c2VyIHRoZW4ga25vd3MgdGhhdCB0aGVpciBjYXJkMC1IRE1JLUEt
MSB1c2VzIGkyYy0yIGFuZCBjYW4gZS5nLiBydW4KZGRjdXRpbDoKCmRkY3V0aWwgLWIgMiBnZXR2
Y3AgMHgxMApWQ1AgY29kZSAweDEwIChCcmlnaHRuZXNzICAgICAgICAgICAgICAgICAgICApOiBj
dXJyZW50IHZhbHVlID0gICAgOTAsIG1heCB2YWx1ZSA9ICAgMTAwCgpUaGUgZmlyc3QgcGF0Y2gg
aW4gdGhlIHNlcmllcyBhZGRzIHN0cnVjdCBpMmNfYWRhcHRlciBwb2ludGVyIHRvIHN0cnVjdApk
cm1fY29ubmVjdG9yLiBJZiB0aGUgZmllbGQgaXMgdXNlZCBieSBhIHBhcnRpY3VsYXIgZHJpdmVy
LCB0aGVuIGFuCmFwcHJvcHJpYXRlIHN5bWJvbGljIGxpbmsgaXMgY3JlYXRlZCBieSB0aGUgZ2Vu
ZXJpYyBjb2RlLCB3aGljaCBpcyBhbHNvIGFkZGVkCmJ5IHRoaXMgcGF0Y2guCgpUaGUgbmV4dCAy
MiBwYXRjaGVzIGlzIGFuIGV4YW1wbGUgb2YgaG93IHRvIGNvbnZlcnQgYSBkcml2ZXIgdG8gdGhp
cyBuZXcgc2NoZW1lLgoKdjEuLnYyOgoKLSB1c2VkIGZpeGVkIG5hbWUgImRkYyIgZm9yIHRoZSBz
eW1ib2xpYyBsaW5rIGluIG9yZGVyIHRvIG1ha2UgaXQgZWFzeSBmb3IKdXNlcnNwYWNlIHRvIGZp
bmQgdGhlIGkyYyBhZGFwdGVyCgp2Mi4udjM6CgotIGNvbnZlcnRlZCBhcyBtYW55IGRyaXZlcnMg
YXMgcG9zc2libGUuCgp2My4udjQ6CgotIGFkZGVkIFJldmlld2VkLWJ5IGZvciBwYXRjaCAwMS8y
MwotIG1vdmVkICJkZGMiIGZpZWxkIGFzc2lnbm1lbnQgdG8gYmVmb3JlIGRybV9jb25uZWN0b3Jf
aW5pdCgpIGlzIGNhbGxlZAppbiBtc20sIHZjNCwgc3RpLCBtZ2FnMjAwLCBhc3QsIGFtZGdwdSwg
cmFkZW9uCi0gc2ltcGxpZmllZCB0aGUgY29kZSBpbiBhbWRncHUgYW5kIHJhZGVvbiBhdCB0aGUg
ZXhwZW5zZSBvZiBzb21lIGxpbmVzCmV4Y2VlZGluZyA4MCBjaGFyYWN0ZXJzIGFzIHBlciBBbGV4
IERldWNoZXIncyBzdWdnZXN0aW9uCi0gYWRkZWQgaTkxNQoKVE9ETzogbm91dmVhdSwgZ21hNTAw
LCBvbWFwZHJtLCBwYW5lbC1zaW1wbGUgLSBpZiBhcHBsaWNhYmxlLgpPdGhlciBkcml2ZXJzIGFy
ZSBlaXRoZXIgYWxyZWFkeSBjb252ZXJ0ZWQgb3IgZG9uJ3QgbWVudGlvbiBuZWl0aGVyCiJkZGMi
IG5vciAiaTJjX2FkYXB0ZXIiLgoKQW5kcnplaiBQaWV0cmFzaWV3aWN6ICgyMyk6CiAgZHJtOiBJ
bmNsdWRlIGRkYyBhZGFwdGVyIHBvaW50ZXIgaW4gc3RydWN0IGRybV9jb25uZWN0b3IKICBkcm0v
ZXh5bm9zOiBQcm92aWRlIGRkYyBzeW1saW5rIGluIGNvbm5lY3RvcidzIHN5c2ZzCiAgZHJtOiBy
b2NrY2hpcDogUHJvdmlkZSBkZGMgc3ltbGluayBpbiByazMwNjZfaGRtaSBzeXNmcyBkaXJlY3Rv
cnkKICBkcm06IHJvY2tjaGlwOiBQcm92aWRlIGRkYyBzeW1saW5rIGluIGlubm9faGRtaSBzeXNm
cyBkaXJlY3RvcnkKICBkcm0vbXNtL2hkbWk6IFByb3ZpZGUgZGRjIHN5bWxpbmsgaW4gaGRtaSBj
b25uZWN0b3Igc3lzZnMgZGlyZWN0b3J5CiAgZHJtL3N1bjRpOiBoZG1pOiBQcm92aWRlIGRkYyBz
eW1saW5rIGluIHN1bjRpIGhkbWkgY29ubmVjdG9yIHN5c2ZzCiAgICBkaXJlY3RvcnkKICBkcm0v
bWVkaWF0ZWs6IFByb3ZpZGUgZGRjIHN5bWxpbmsgaW4gaGRtaSBjb25uZWN0b3Igc3lzZnMgZGly
ZWN0b3J5CiAgZHJtL3RlZ3JhOiBQcm92aWRlIGRkYyBzeW1saW5rIGluIG91dHB1dCBjb25uZWN0
b3Igc3lzZnMgZGlyZWN0b3J5CiAgZHJtL2lteDogaW14LWxkYjogUHJvdmlkZSBkZGMgc3ltbGlu
ayBpbiBjb25uZWN0b3IncyBzeXNmcwogIGRybS9pbXg6IGlteC10dmU6IFByb3ZpZGUgZGRjIHN5
bWxpbmsgaW4gY29ubmVjdG9yJ3Mgc3lzZnMKICBkcm0vdmM0OiBQcm92aWRlIGRkYyBzeW1saW5r
IGluIGNvbm5lY3RvciBzeXNmcyBkaXJlY3RvcnkKICBkcm06IHp0ZTogUHJvdmlkZSBkZGMgc3lt
bGluayBpbiBoZG1pIGNvbm5lY3RvciBzeXNmcyBkaXJlY3RvcnkKICBkcm06IHp0ZTogUHJvdmlk
ZSBkZGMgc3ltbGluayBpbiB2Z2EgY29ubmVjdG9yIHN5c2ZzIGRpcmVjdG9yeQogIGRybS90aWxj
ZGM6IFByb3ZpZGUgZGRjIHN5bWxpbmsgaW4gY29ubmVjdG9yIHN5c2ZzIGRpcmVjdG9yeQogIGRy
bTogc3RpOiBQcm92aWRlIGRkYyBzeW1saW5rIGluIGhkbWkgY29ubmVjdG9yIHN5c2ZzIGRpcmVj
dG9yeQogIGRybS9tZ2FnMjAwOiBQcm92aWRlIGRkYyBzeW1saW5rIGluIGNvbm5lY3RvciBzeXNm
cyBkaXJlY3RvcnkKICBkcm0vYXN0OiBQcm92aWRlIGRkYyBzeW1saW5rIGluIGNvbm5lY3RvciBz
eXNmcyBkaXJlY3RvcnkKICBkcm0vYnJpZGdlOiBkdW1iLXZnYS1kYWM6IFByb3ZpZGUgZGRjIHN5
bWxpbmsgaW4gY29ubmVjdG9yIHN5c2ZzCiAgICBkaXJlY3RvcnkKICBkcm0vYnJpZGdlOiBkdy1o
ZG1pOiBQcm92aWRlIGRkYyBzeW1saW5rIGluIGNvbm5lY3RvciBzeXNmcyBkaXJlY3RvcnkKICBk
cm0vYnJpZGdlOiB0aS10ZnA0MTA6IFByb3ZpZGUgZGRjIHN5bWxpbmsgaW4gY29ubmVjdG9yIHN5
c2ZzCiAgICBkaXJlY3RvcnkKICBkcm0vYW1kZ3B1OiBQcm92aWRlIGRkYyBzeW1saW5rIGluIGNv
bm5lY3RvciBzeXNmcyBkaXJlY3RvcnkKICBkcm0vcmFkZW9uOiBQcm92aWRlIGRkYyBzeW1saW5r
IGluIGNvbm5lY3RvciBzeXNmcyBkaXJlY3RvcnkKICBkcm0vaTkxNTogUHJvdmlkZSBkZGMgc3lt
bGluayBpbiBoZG1pIGNvbm5lY3RvciBzeXNmcyBkaXJlY3RvcnkKCiAuLi4vZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV9jb25uZWN0b3JzLmMgICAgfCA1NiArKysrKysrKy0tLS0tCiBkcml2ZXJz
L2dwdS9kcm0vYXN0L2FzdF9tb2RlLmMgICAgICAgICAgICAgICAgfCAgOSArKy0KIGRyaXZlcnMv
Z3B1L2RybS9icmlkZ2UvZHVtYi12Z2EtZGFjLmMgICAgICAgICB8IDE5ICsrKy0tCiBkcml2ZXJz
L2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhkbWkuYyAgICAgfCA0MCArKysrKy0tLS0tCiBk
cml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RpLXRmcDQxMC5jICAgICAgICAgICAgfCAxOSArKystLQog
ZHJpdmVycy9ncHUvZHJtL2RybV9zeXNmcy5jICAgICAgICAgICAgICAgICAgIHwgIDcgKysKIGRy
aXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2hkbWkuYyAgICAgICAgICB8IDExICsrLQogZHJp
dmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9oZG1pLmMgICAgIHwgIDUgKy0KIGRyaXZl
cnMvZ3B1L2RybS9pbXgvaW14LWxkYi5jICAgICAgICAgICAgICAgICB8IDEzICsrLQogZHJpdmVy
cy9ncHUvZHJtL2lteC9pbXgtdHZlLmMgICAgICAgICAgICAgICAgIHwgIDggKy0KIGRyaXZlcnMv
Z3B1L2RybS9tZWRpYXRlay9tdGtfaGRtaS5jICAgICAgICAgICB8ICA5ICstLQogZHJpdmVycy9n
cHUvZHJtL21nYWcyMDAvbWdhZzIwMF9tb2RlLmMgICAgICAgIHwgIDkgKystCiBkcml2ZXJzL2dw
dS9kcm0vbXNtL2hkbWkvaGRtaV9jb25uZWN0b3IuYyAgICAgfCAgMSArCiBkcml2ZXJzL2dwdS9k
cm0vcmFkZW9uL3JhZGVvbl9jb25uZWN0b3JzLmMgICAgfCA4MCArKysrKysrKysrKystLS0tLS0t
CiBkcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvaW5ub19oZG1pLmMgICAgICAgICAgfCAxNyArKy0t
CiBkcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvcmszMDY2X2hkbWkuYyAgICAgICAgfCAxNyArKy0t
CiBkcml2ZXJzL2dwdS9kcm0vc3RpL3N0aV9oZG1pLmMgICAgICAgICAgICAgICAgfCAgMSArCiBk
cml2ZXJzL2dwdS9kcm0vc3VuNGkvc3VuNGlfaGRtaS5oICAgICAgICAgICAgfCAgMSAtCiBkcml2
ZXJzL2dwdS9kcm0vc3VuNGkvc3VuNGlfaGRtaV9lbmMuYyAgICAgICAgfCAxNCArKy0tCiBkcml2
ZXJzL2dwdS9kcm0vdGVncmEvZHJtLmggICAgICAgICAgICAgICAgICAgfCAgMSAtCiBkcml2ZXJz
L2dwdS9kcm0vdGVncmEvb3V0cHV0LmMgICAgICAgICAgICAgICAgfCAxMiArLS0KIGRyaXZlcnMv
Z3B1L2RybS90ZWdyYS9zb3IuYyAgICAgICAgICAgICAgICAgICB8ICA2ICstCiBkcml2ZXJzL2dw
dS9kcm0vdGlsY2RjL3RpbGNkY190ZnA0MTAuYyAgICAgICAgfCAgMSArCiBkcml2ZXJzL2dwdS9k
cm0vdmM0L3ZjNF9oZG1pLmMgICAgICAgICAgICAgICAgfCAyMSArKy0tLQogZHJpdmVycy9ncHUv
ZHJtL3p0ZS96eF9oZG1pLmMgICAgICAgICAgICAgICAgIHwgMjUgKysrLS0tCiBkcml2ZXJzL2dw
dS9kcm0venRlL3p4X3ZnYS5jICAgICAgICAgICAgICAgICAgfCAyNSArKystLS0KIGluY2x1ZGUv
ZHJtL2RybV9jb25uZWN0b3IuaCAgICAgICAgICAgICAgICAgICB8IDExICsrKwogMjcgZmlsZXMg
Y2hhbmdlZCwgMjQwIGluc2VydGlvbnMoKyksIDE5OCBkZWxldGlvbnMoLSkKCi0tIAoyLjE3LjEK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZngg
bWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
