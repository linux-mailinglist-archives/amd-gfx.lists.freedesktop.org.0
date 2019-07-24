Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AA2973073
	for <lists+amd-gfx@lfdr.de>; Wed, 24 Jul 2019 16:00:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9B226E54E;
	Wed, 24 Jul 2019 14:00:25 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 535FD6E544;
 Wed, 24 Jul 2019 14:00:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: andrzej.p) with ESMTPSA id 792BB28A8D3
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v5 00/24] Associate ddc adapters with connectors
Date: Wed, 24 Jul 2019 15:59:22 +0200
Message-Id: <cover.1563960855.git.andrzej.p@collabora.com>
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
 David Airlie <airlied@linux.ie>, Ramalingam C <ramalingam.c@intel.com>,
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
 Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>,
 Kukjin Kim <kgene@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
 CK Hu <ck.hu@mediatek.com>, Dave Airlie <airlied@redhat.com>,
 intel-gfx@lists.freedesktop.org, Shashank Sharma <shashank.sharma@intel.com>,
 freedreno@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>, Jonas Karlman <jonas@kwiboo.se>,
 linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, Inki Dae <inki.dae@samsung.com>,
 Alexios Zavras <alexios.zavras@intel.com>,
 Mamta Shukla <mamtashukla555@gmail.com>, linux-mediatek@lists.infradead.org,
 Jyri Sarha <jsarha@ti.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, Chris Wilson <chris@chris-wilson.co.uk>,
 Sean Paul <sean@poorly.run>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Allison Randal <allison@lohutok.net>, linux-arm-kernel@lists.infradead.org,
 Jernej Skrabec <jernej.skrabec@siol.net>, amd-gfx@lists.freedesktop.org,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Eric Anholt <eric@anholt.net>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, Sandy Huang <hjc@rock-chips.com>,
 linux-kernel@vger.kernel.org, Todor Tomov <todor.tomov@linaro.org>,
 Kyungmin Park <kyungmin.park@samsung.com>, Huang Rui <ray.huang@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>,
 Shawn Guo <shawnguo@kernel.org>,
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
Y3AgMHgxMApWQ1AgY29kZSAweDEwIChCcmlnaHRuZXNzKTogY3VycmVudCB2YWx1ZSA9ICAgIDkw
LCBtYXggdmFsdWUgPSAgIDEwMAoKVGhlIGZpcnN0IHBhdGNoIGluIHRoZSBzZXJpZXMgYWRkcyBz
dHJ1Y3QgaTJjX2FkYXB0ZXIgcG9pbnRlciB0byBzdHJ1Y3QKZHJtX2Nvbm5lY3Rvci4gSWYgdGhl
IGZpZWxkIGlzIHVzZWQgYnkgYSBwYXJ0aWN1bGFyIGRyaXZlciwgdGhlbiBhbgphcHByb3ByaWF0
ZSBzeW1ib2xpYyBsaW5rIGlzIGNyZWF0ZWQgYnkgdGhlIGdlbmVyaWMgY29kZSwgd2hpY2ggaXMg
YWxzbyBhZGRlZApieSB0aGlzIHBhdGNoLgoKUGF0Y2ggMiBhZGRzIGEgbmV3IHZhcmlhbnQgb2Yg
ZHJtX2Nvbm5lY3Rvcl9pbml0KCksIHNlZSB0aGUgY2hhbmdlbG9nCmJlbG93LgoKUGF0Y2hlcyAz
Li4yNCBhcmUgZXhhbXBsZXMgb2YgaG93IHRvIGNvbnZlcnQgYSBkcml2ZXIgdG8gdGhpcyBuZXcg
c2NoZW1lLgoKdjEuLnYyOgoKLSB1c2VkIGZpeGVkIG5hbWUgImRkYyIgZm9yIHRoZSBzeW1ib2xp
YyBsaW5rIGluIG9yZGVyIHRvIG1ha2UgaXQgZWFzeSBmb3IKdXNlcnNwYWNlIHRvIGZpbmQgdGhl
IGkyYyBhZGFwdGVyCgp2Mi4udjM6CgotIGNvbnZlcnRlZCBhcyBtYW55IGRyaXZlcnMgYXMgcG9z
c2libGUuCgp2My4udjQ6CgotIGFkZGVkIFJldmlld2VkLWJ5IGZvciBwYXRjaCAwMS8yMwotIG1v
dmVkICJkZGMiIGZpZWxkIGFzc2lnbm1lbnQgdG8gYmVmb3JlIGRybV9jb25uZWN0b3JfaW5pdCgp
IGlzIGNhbGxlZAppbiBtc20sIHZjNCwgc3RpLCBtZ2FnMjAwLCBhc3QsIGFtZGdwdSwgcmFkZW9u
Ci0gc2ltcGxpZmllZCB0aGUgY29kZSBpbiBhbWRncHUgYW5kIHJhZGVvbiBhdCB0aGUgZXhwZW5z
ZSBvZiBzb21lIGxpbmVzCmV4Y2VlZGluZyA4MCBjaGFyYWN0ZXJzIGFzIHBlciBBbGV4IERldWNo
ZXIncyBzdWdnZXN0aW9uCi0gYWRkZWQgaTkxNQoKdjQuLnY1OgoKLSBjaGFuZ2VkICJpbmNsdWRl
IDxsaW51eC9pMmMuaD4iIHRvICJzdHJ1Y3QgaTJjX2FkYXB0ZXI7IgppbiBkcm1fY29ubmVjdG9y
LmgsIGNvbnNlcXVlbnRseSwgYWRkZWQgImluY2x1ZGUgPGxpbnV4L2kyYy5oPiIKaW4gZHJtX3N5
c2ZzLmMuCi0gYWRkZWQgImRybV9jb25uZWN0b3JfaW5pdF93aXRoX2RkYygpIiB2YXJpYW50IHRv
IGVuc3VyZSB0aGF0IHRoZSBkZGMKZmllbGQgb2YgZHJtX2Nvbm5lY3RvciBpcyBwcmVzZXJ2ZWQg
YWNjcm9zcyBpdHMgaW52b2NhdGlvbgotIGFjY29yZGluZ2x5IGNoYW5nZWQgaW52b2NhdGlvbnMg
b2YgZHJtX2Nvbm5lY3Rvcl9pbml0KCkgaW4gdGhlCnRvdWNoZWQgZHJpdmVycyB0byB1c2UgdGhl
IG5ldyB2YXJpYW50CgpAQmVuamFtaW4KQFNoYXduCkBUaG9tYXMKClRoZXJlIHdlcmUgeW91ciBB
Y2tlZC1ieSBvciBSZXZpZXdlZC1ieSBmb3Igc29tZSBwYXRjaGVzIGluIHY0LCBidXQgbm93CnRo
YXQgdGhlIHBhdGNoZXMgdXNlIHRoZSBuZXdseSBhZGRlZCBmdW5jdGlvbiBJJ20gbm90IHN1cmUg
SSBjYW4gc3RpbGwKaW5jbHVkZSB0aG9zZSB0YWdzIHdpdGhvdXQgeW91IGFjdHVhbGx5IGNvbmZp
cm1pbmcuIENhbiBJPyBPciBjYW4geW91CnBsZWFzZSByZS1yZXZpZXc/IAoKVE9ETzogbm91dmVh
dSwgZ21hNTAwLCBvbWFwZHJtLCBwYW5lbC1zaW1wbGUgLSBpZiBhcHBsaWNhYmxlLgpPdGhlciBk
cml2ZXJzIGFyZSBlaXRoZXIgYWxyZWFkeSBjb252ZXJ0ZWQgb3IgZG9uJ3QgbWVudGlvbiBuZWl0
aGVyCiJkZGMiIG5vciAiaTJjX2FkYXB0ZXIiLgoKQW5kcnplaiBQaWV0cmFzaWV3aWN6ICgyNCk6
CiAgZHJtOiBJbmNsdWRlIGRkYyBhZGFwdGVyIHBvaW50ZXIgaW4gc3RydWN0IGRybV9jb25uZWN0
b3IKICBkcm06IEFkZCBkcm1fY29ubmVjdG9yX2luaXQoKSB2YXJpYW50IHdpdGggZGRjCiAgZHJt
L2V4eW5vczogUHJvdmlkZSBkZGMgc3ltbGluayBpbiBjb25uZWN0b3IncyBzeXNmcwogIGRybTog
cm9ja2NoaXA6IFByb3ZpZGUgZGRjIHN5bWxpbmsgaW4gcmszMDY2X2hkbWkgc3lzZnMgZGlyZWN0
b3J5CiAgZHJtOiByb2NrY2hpcDogUHJvdmlkZSBkZGMgc3ltbGluayBpbiBpbm5vX2hkbWkgc3lz
ZnMgZGlyZWN0b3J5CiAgZHJtL21zbS9oZG1pOiBQcm92aWRlIGRkYyBzeW1saW5rIGluIGhkbWkg
Y29ubmVjdG9yIHN5c2ZzIGRpcmVjdG9yeQogIGRybS9zdW40aTogaGRtaTogUHJvdmlkZSBkZGMg
c3ltbGluayBpbiBzdW40aSBoZG1pIGNvbm5lY3RvciBzeXNmcwogICAgZGlyZWN0b3J5CiAgZHJt
L21lZGlhdGVrOiBQcm92aWRlIGRkYyBzeW1saW5rIGluIGhkbWkgY29ubmVjdG9yIHN5c2ZzIGRp
cmVjdG9yeQogIGRybS90ZWdyYTogUHJvdmlkZSBkZGMgc3ltbGluayBpbiBvdXRwdXQgY29ubmVj
dG9yIHN5c2ZzIGRpcmVjdG9yeQogIGRybS9pbXg6IGlteC1sZGI6IFByb3ZpZGUgZGRjIHN5bWxp
bmsgaW4gY29ubmVjdG9yJ3Mgc3lzZnMKICBkcm0vaW14OiBpbXgtdHZlOiBQcm92aWRlIGRkYyBz
eW1saW5rIGluIGNvbm5lY3RvcidzIHN5c2ZzCiAgZHJtL3ZjNDogUHJvdmlkZSBkZGMgc3ltbGlu
ayBpbiBjb25uZWN0b3Igc3lzZnMgZGlyZWN0b3J5CiAgZHJtOiB6dGU6IFByb3ZpZGUgZGRjIHN5
bWxpbmsgaW4gaGRtaSBjb25uZWN0b3Igc3lzZnMgZGlyZWN0b3J5CiAgZHJtOiB6dGU6IFByb3Zp
ZGUgZGRjIHN5bWxpbmsgaW4gdmdhIGNvbm5lY3RvciBzeXNmcyBkaXJlY3RvcnkKICBkcm0vdGls
Y2RjOiBQcm92aWRlIGRkYyBzeW1saW5rIGluIGNvbm5lY3RvciBzeXNmcyBkaXJlY3RvcnkKICBk
cm06IHN0aTogUHJvdmlkZSBkZGMgc3ltbGluayBpbiBoZG1pIGNvbm5lY3RvciBzeXNmcyBkaXJl
Y3RvcnkKICBkcm0vbWdhZzIwMDogUHJvdmlkZSBkZGMgc3ltbGluayBpbiBjb25uZWN0b3Igc3lz
ZnMgZGlyZWN0b3J5CiAgZHJtL2FzdDogUHJvdmlkZSBkZGMgc3ltbGluayBpbiBjb25uZWN0b3Ig
c3lzZnMgZGlyZWN0b3J5CiAgZHJtL2JyaWRnZTogZHVtYi12Z2EtZGFjOiBQcm92aWRlIGRkYyBz
eW1saW5rIGluIGNvbm5lY3RvciBzeXNmcwogICAgZGlyZWN0b3J5CiAgZHJtL2JyaWRnZTogZHct
aGRtaTogUHJvdmlkZSBkZGMgc3ltbGluayBpbiBjb25uZWN0b3Igc3lzZnMgZGlyZWN0b3J5CiAg
ZHJtL2JyaWRnZTogdGktdGZwNDEwOiBQcm92aWRlIGRkYyBzeW1saW5rIGluIGNvbm5lY3RvciBz
eXNmcwogICAgZGlyZWN0b3J5CiAgZHJtL2FtZGdwdTogUHJvdmlkZSBkZGMgc3ltbGluayBpbiBj
b25uZWN0b3Igc3lzZnMgZGlyZWN0b3J5CiAgZHJtL3JhZGVvbjogUHJvdmlkZSBkZGMgc3ltbGlu
ayBpbiBjb25uZWN0b3Igc3lzZnMgZGlyZWN0b3J5CiAgZHJtL2k5MTU6IFByb3ZpZGUgZGRjIHN5
bWxpbmsgaW4gaGRtaSBjb25uZWN0b3Igc3lzZnMgZGlyZWN0b3J5CgogLi4uL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfY29ubmVjdG9ycy5jICAgIHwgIDk1ICsrKysrKysrLS0tLQogZHJpdmVy
cy9ncHUvZHJtL2FzdC9hc3RfbW9kZS5jICAgICAgICAgICAgICAgIHwgIDEzICstCiBkcml2ZXJz
L2dwdS9kcm0vYnJpZGdlL2R1bWItdmdhLWRhYy5jICAgICAgICAgfCAgMjUgKystLQogZHJpdmVy
cy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1oZG1pLmMgICAgIHwgIDQ2ICsrKy0tLQogZHJp
dmVycy9ncHUvZHJtL2JyaWRnZS90aS10ZnA0MTAuYyAgICAgICAgICAgIHwgIDI1ICsrLS0KIGRy
aXZlcnMvZ3B1L2RybS9kcm1fY29ubmVjdG9yLmMgICAgICAgICAgICAgICB8ICAxOSArKysKIGRy
aXZlcnMvZ3B1L2RybS9kcm1fc3lzZnMuYyAgICAgICAgICAgICAgICAgICB8ICAgOCArCiBkcml2
ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19oZG1pLmMgICAgICAgICAgfCAgMTcgKystCiBkcml2
ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2hkbWkuYyAgICAgfCAgMTEgKy0KIGRyaXZl
cnMvZ3B1L2RybS9pbXgvaW14LWxkYi5jICAgICAgICAgICAgICAgICB8ICAyMCArLS0KIGRyaXZl
cnMvZ3B1L2RybS9pbXgvaW14LXR2ZS5jICAgICAgICAgICAgICAgICB8ICAxNCArLQogZHJpdmVy
cy9ncHUvZHJtL21lZGlhdGVrL210a19oZG1pLmMgICAgICAgICAgIHwgIDE2ICstCiBkcml2ZXJz
L2dwdS9kcm0vbWdhZzIwMC9tZ2FnMjAwX21vZGUuYyAgICAgICAgfCAgMTMgKy0KIGRyaXZlcnMv
Z3B1L2RybS9tc20vaGRtaS9oZG1pX2Nvbm5lY3Rvci5jICAgICB8ICAgNiArLQogZHJpdmVycy9n
cHUvZHJtL3JhZGVvbi9yYWRlb25fY29ubmVjdG9ycy5jICAgIHwgMTQxICsrKysrKysrKysrKyst
LS0tLQogZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL2lubm9faGRtaS5jICAgICAgICAgIHwgIDIz
ICstLQogZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL3JrMzA2Nl9oZG1pLmMgICAgICAgIHwgIDI0
ICstLQogZHJpdmVycy9ncHUvZHJtL3N0aS9zdGlfaGRtaS5jICAgICAgICAgICAgICAgIHwgICA2
ICstCiBkcml2ZXJzL2dwdS9kcm0vc3VuNGkvc3VuNGlfaGRtaS5oICAgICAgICAgICAgfCAgIDEg
LQogZHJpdmVycy9ncHUvZHJtL3N1bjRpL3N1bjRpX2hkbWlfZW5jLmMgICAgICAgIHwgIDIxICst
LQogZHJpdmVycy9ncHUvZHJtL3RlZ3JhL2RybS5oICAgICAgICAgICAgICAgICAgIHwgICAxIC0K
IGRyaXZlcnMvZ3B1L2RybS90ZWdyYS9oZG1pLmMgICAgICAgICAgICAgICAgICB8ICAgNyArLQog
ZHJpdmVycy9ncHUvZHJtL3RlZ3JhL291dHB1dC5jICAgICAgICAgICAgICAgIHwgIDEyICstCiBk
cml2ZXJzL2dwdS9kcm0vdGVncmEvc29yLmMgICAgICAgICAgICAgICAgICAgfCAgMTMgKy0KIGRy
aXZlcnMvZ3B1L2RybS90aWxjZGMvdGlsY2RjX3RmcDQxMC5jICAgICAgICB8ICAgNiArLQogZHJp
dmVycy9ncHUvZHJtL3ZjNC92YzRfaGRtaS5jICAgICAgICAgICAgICAgIHwgIDI2ICsrLS0KIGRy
aXZlcnMvZ3B1L2RybS96dGUvenhfaGRtaS5jICAgICAgICAgICAgICAgICB8ICAzMSArKy0tCiBk
cml2ZXJzL2dwdS9kcm0venRlL3p4X3ZnYS5jICAgICAgICAgICAgICAgICAgfCAgMzEgKystLQog
aW5jbHVkZS9kcm0vZHJtX2Nvbm5lY3Rvci5oICAgICAgICAgICAgICAgICAgIHwgIDE2ICsrCiAy
OSBmaWxlcyBjaGFuZ2VkLCA0MjggaW5zZXJ0aW9ucygrKSwgMjU5IGRlbGV0aW9ucygtKQoKLS0g
CjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
