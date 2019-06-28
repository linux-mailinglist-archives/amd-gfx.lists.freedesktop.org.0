Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 015DD5A0DE
	for <lists+amd-gfx@lfdr.de>; Fri, 28 Jun 2019 18:31:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45F866E964;
	Fri, 28 Jun 2019 16:31:44 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50CCE88B2B;
 Fri, 28 Jun 2019 16:04:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: andrzej.p) with ESMTPSA id 8292D260A37
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 00/22] Associate ddc adapters with connectors
Date: Fri, 28 Jun 2019 18:01:14 +0200
Message-Id: <cover.1561735433.git.andrzej.p@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <3fb19371-db7d-f9dc-31a7-1ccd126f6784@collabora.com>
References: <3fb19371-db7d-f9dc-31a7-1ccd126f6784@collabora.com>
X-Mailman-Approved-At: Fri, 28 Jun 2019 16:31:43 +0000
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
 Douglas Anderson <dianders@chromium.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>, kernel@collabora.com,
 Fabio Estevam <festevam@gmail.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 "David \(ChunMing\) Zhou" <David1.Zhou@amd.com>,
 linux-samsung-soc@vger.kernel.org, Joonyoung Shim <jy0922.shim@samsung.com>,
 linux-rockchip@lists.infradead.org, Vincent Abriou <vincent.abriou@st.com>,
 Rob Clark <robdclark@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, David Airlie <airlied@linux.ie>,
 Chen-Yu Tsai <wens@csie.org>, Kukjin Kim <kgene@kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>, CK Hu <ck.hu@mediatek.com>,
 Dave Airlie <airlied@redhat.com>, freedreno@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Jonas Karlman <jonas@kwiboo.se>, linux-arm-msm@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Jyri Sarha <jsarha@ti.com>, Inki Dae <inki.dae@samsung.com>,
 Mamta Shukla <mamtashukla555@gmail.com>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Thomas Gleixner <tglx@linutronix.de>, Sean Paul <sean@poorly.run>,
 Allison Randal <allison@lohutok.net>, linux-arm-kernel@lists.infradead.org,
 Jernej Skrabec <jernej.skrabec@siol.net>, amd-gfx@lists.freedesktop.org,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Eric Anholt <eric@anholt.net>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, Sandy Huang <hjc@rock-chips.com>,
 linux-kernel@vger.kernel.org, Todor Tomov <todor.tomov@linaro.org>,
 Kyungmin Park <kyungmin.park@samsung.com>, Huang Rui <ray.huang@amd.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
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
ZXJpYyBjb2RlLCB3aGljaCBpcyBhbHNvIGFkZGVkCmJ5IHRoaXMgcGF0Y2guCgpUaGUgc2Vjb25k
IHBhdGNoIGlzIGFuIGV4YW1wbGUgb2YgaG93IHRvIGNvbnZlcnQgYSBkcml2ZXIgdG8gdGhpcyBu
ZXcgc2NoZW1lLgoKdjEuLnYyOgoKLSB1c2VkIGZpeGVkIG5hbWUgImRkYyIgZm9yIHRoZSBzeW1i
b2xpYyBsaW5rIGluIG9yZGVyIHRvIG1ha2UgaXQgZWFzeSBmb3IKdXNlcnNwYWNlIHRvIGZpbmQg
dGhlIGkyYyBhZGFwdGVyCgp2Mi4udjM6CgotIGNvbnZlcnRlZCBhcyBtYW55IGRyaXZlcnMgYXMg
cG9zc2libGUuCgpQQVRDSEVTIDMvMjItMjIvMjIgU0hPVUxEIEJFIENPTlNJREVSRUQgUkZDIQoK
QW5kcnplaiBQaWV0cmFzaWV3aWN6ICgyMik6CiAgZHJtOiBJbmNsdWRlIGRkYyBhZGFwdGVyIHBv
aW50ZXIgaW4gc3RydWN0IGRybV9jb25uZWN0b3IKICBkcm0vZXh5bm9zOiBQcm92aWRlIGRkYyBz
eW1saW5rIGluIGNvbm5lY3RvcidzIHN5c2ZzCiAgZHJtOiByb2NrY2hpcDogUHJvdmlkZSBkZGMg
c3ltbGluayBpbiByazMwNjZfaGRtaSBzeXNmcyBkaXJlY3RvcnkKICBkcm06IHJvY2tjaGlwOiBQ
cm92aWRlIGRkYyBzeW1saW5rIGluIGlubm9faGRtaSBzeXNmcyBkaXJlY3RvcnkKICBkcm0vbXNt
L2hkbWk6IFByb3ZpZGUgZGRjIHN5bWxpbmsgaW4gaGRtaSBjb25uZWN0b3Igc3lzZnMgZGlyZWN0
b3J5CiAgZHJtL3N1bjRpOiBoZG1pOiBQcm92aWRlIGRkYyBzeW1saW5rIGluIHN1bjRpIGhkbWkg
Y29ubmVjdG9yIHN5c2ZzCiAgICBkaXJlY3RvcnkKICBkcm0vbWVkaWF0ZWs6IFByb3ZpZGUgZGRj
IHN5bWxpbmsgaW4gaGRtaSBjb25uZWN0b3Igc3lzZnMgZGlyZWN0b3J5CiAgZHJtL3RlZ3JhOiBQ
cm92aWRlIGRkYyBzeW1saW5rIGluIG91dHB1dCBjb25uZWN0b3Igc3lzZnMgZGlyZWN0b3J5CiAg
ZHJtL2lteDogaW14LWxkYjogUHJvdmlkZSBkZGMgc3ltbGluayBpbiBjb25uZWN0b3IncyBzeXNm
cwogIGRybS9pbXg6IGlteC10dmU6IFByb3ZpZGUgZGRjIHN5bWxpbmsgaW4gY29ubmVjdG9yJ3Mg
c3lzZnMKICBkcm0vdmM0OiBQcm92aWRlIGRkYyBzeW1saW5rIGluIGNvbm5lY3RvciBzeXNmcyBk
aXJlY3RvcnkKICBkcm06IHp0ZTogUHJvdmlkZSBkZGMgc3ltbGluayBpbiBoZG1pIGNvbm5lY3Rv
ciBzeXNmcyBkaXJlY3RvcnkKICBkcm06IHp0ZTogUHJvdmlkZSBkZGMgc3ltbGluayBpbiB2Z2Eg
Y29ubmVjdG9yIHN5c2ZzIGRpcmVjdG9yeQogIGRybS90aWxjZGM6IFByb3ZpZGUgZGRjIHN5bWxp
bmsgaW4gY29ubmVjdG9yIHN5c2ZzIGRpcmVjdG9yeQogIGRybTogc3RpOiBQcm92aWRlIGRkYyBz
eW1saW5rIGluIGhkbWkgY29ubmVjdG9yIHN5c2ZzIGRpcmVjdG9yeQogIGRybS9tZ2FnMjAwOiBQ
cm92aWRlIGRkYyBzeW1saW5rIGluIGNvbm5lY3RvciBzeXNmcyBkaXJlY3RvcnkKICBkcm0vYXN0
OiBQcm92aWRlIGRkYyBzeW1saW5rIGluIGNvbm5lY3RvciBzeXNmcyBkaXJlY3RvcnkKICBkcm0v
YnJpZGdlOiBkdW1iLXZnYS1kYWM6IFByb3ZpZGUgZGRjIHN5bWxpbmsgaW4gY29ubmVjdG9yIHN5
c2ZzCiAgICBkaXJlY3RvcnkKICBkcm0vYnJpZGdlOiBkdy1oZG1pOiBQcm92aWRlIGRkYyBzeW1s
aW5rIGluIGNvbm5lY3RvciBzeXNmcyBkaXJlY3RvcnkKICBkcm0vYnJpZGdlOiB0aS10ZnA0MTA6
IFByb3ZpZGUgZGRjIHN5bWxpbmsgaW4gY29ubmVjdG9yIHN5c2ZzCiAgICBkaXJlY3RvcnkKICBk
cm0vYW1kZ3B1OiBQcm92aWRlIGRkYyBzeW1saW5rIGluIGNvbm5lY3RvciBzeXNmcyBkaXJlY3Rv
cnkKICBkcm0vcmFkZW9uOiBQcm92aWRlIGRkYyBzeW1saW5rIGluIGNvbm5lY3RvciBzeXNmcyBk
aXJlY3RvcnkKCiAuLi4vZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9jb25uZWN0b3JzLmMgICAg
fCA3MCArKysrKysrKysrKy0tLS0tCiBkcml2ZXJzL2dwdS9kcm0vYXN0L2FzdF9tb2RlLmMgICAg
ICAgICAgICAgICAgfCAgMSArCiBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2R1bWItdmdhLWRhYy5j
ICAgICAgICAgfCAxOSArKy0tLQogZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1o
ZG1pLmMgICAgIHwgNDAgKysrKy0tLS0tCiBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RpLXRmcDQx
MC5jICAgICAgICAgICAgfCAxOSArKy0tLQogZHJpdmVycy9ncHUvZHJtL2RybV9zeXNmcy5jICAg
ICAgICAgICAgICAgICAgIHwgIDcgKysKIGRyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2hk
bWkuYyAgICAgICAgICB8IDExICsrLQogZHJpdmVycy9ncHUvZHJtL2lteC9pbXgtbGRiLmMgICAg
ICAgICAgICAgICAgIHwgMTMgKystCiBkcml2ZXJzL2dwdS9kcm0vaW14L2lteC10dmUuYyAgICAg
ICAgICAgICAgICAgfCAgOCArLQogZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19oZG1pLmMg
ICAgICAgICAgIHwgIDkgKy0KIGRyaXZlcnMvZ3B1L2RybS9tZ2FnMjAwL21nYWcyMDBfbW9kZS5j
ICAgICAgICB8ICAxICsKIGRyaXZlcnMvZ3B1L2RybS9tc20vaGRtaS9oZG1pX2Nvbm5lY3Rvci5j
ICAgICB8ICAxICsKIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2Nvbm5lY3RvcnMuYyAg
ICB8IDgyICsrKysrKysrKysrKysrLS0tLS0KIGRyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9pbm5v
X2hkbWkuYyAgICAgICAgICB8IDE3ICsrLS0KIGRyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9yazMw
NjZfaGRtaS5jICAgICAgICB8IDE3ICsrLS0KIGRyaXZlcnMvZ3B1L2RybS9zdGkvc3RpX2hkbWku
YyAgICAgICAgICAgICAgICB8ICAxICsKIGRyaXZlcnMvZ3B1L2RybS9zdW40aS9zdW40aV9oZG1p
LmggICAgICAgICAgICB8ICAxIC0KIGRyaXZlcnMvZ3B1L2RybS9zdW40aS9zdW40aV9oZG1pX2Vu
Yy5jICAgICAgICB8IDE0ICsrLS0KIGRyaXZlcnMvZ3B1L2RybS90ZWdyYS9kcm0uaCAgICAgICAg
ICAgICAgICAgICB8ICAxIC0KIGRyaXZlcnMvZ3B1L2RybS90ZWdyYS9vdXRwdXQuYyAgICAgICAg
ICAgICAgICB8IDEyICstLQogZHJpdmVycy9ncHUvZHJtL3RlZ3JhL3Nvci5jICAgICAgICAgICAg
ICAgICAgIHwgIDYgKy0KIGRyaXZlcnMvZ3B1L2RybS90aWxjZGMvdGlsY2RjX3RmcDQxMC5jICAg
ICAgICB8ICAxICsKIGRyaXZlcnMvZ3B1L2RybS92YzQvdmM0X2hkbWkuYyAgICAgICAgICAgICAg
ICB8IDE2ICsrLS0KIGRyaXZlcnMvZ3B1L2RybS96dGUvenhfaGRtaS5jICAgICAgICAgICAgICAg
ICB8IDI1ICsrLS0tLQogZHJpdmVycy9ncHUvZHJtL3p0ZS96eF92Z2EuYyAgICAgICAgICAgICAg
ICAgIHwgMjUgKystLS0tCiBpbmNsdWRlL2RybS9kcm1fY29ubmVjdG9yLmggICAgICAgICAgICAg
ICAgICAgfCAxMSArKysKIDI2IGZpbGVzIGNoYW5nZWQsIDI1MiBpbnNlcnRpb25zKCspLCAxNzYg
ZGVsZXRpb25zKC0pCgotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2FtZC1nZng=
