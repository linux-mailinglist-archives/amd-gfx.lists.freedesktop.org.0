Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 77FDF5AF5A
	for <lists+amd-gfx@lfdr.de>; Sun, 30 Jun 2019 10:13:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BFD689612;
	Sun, 30 Jun 2019 08:13:02 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F6D6895C4;
 Sun, 30 Jun 2019 08:13:00 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 32FEBAF2A;
 Sun, 30 Jun 2019 08:12:58 +0000 (UTC)
Subject: Re: [PATCH v3 01/22] drm: Include ddc adapter pointer in struct
 drm_connector
To: Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
 dri-devel@lists.freedesktop.org
References: <3fb19371-db7d-f9dc-31a7-1ccd126f6784@collabora.com>
 <cover.1561735433.git.andrzej.p@collabora.com>
 <d6381c020ea1c848a7044d830bdb0ec9663d1619.1561735433.git.andrzej.p@collabora.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Openpgp: preference=signencrypt
Autocrypt: addr=tzimmermann@suse.de; keydata=
 xsBNBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdg
 XH47fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0
 BeB5BbqP5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4Yc
 hdHm3bkPjz9EErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB
 9GluwvIhSezPgnEmimZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEB
 AAHNKFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmNvbT7CwJQEEwEIAD4W
 IQRyF/usjOnPY0ShaOVoDcEdUwt6IwUCWznTtgIbAwUJA8JnAAULCQgHAgYVCgkICwIEFgID
 AQIeAQIXgAAKCRBoDcEdUwt6I7D7CACBK42XW+7mCiK8ioXMEy1NzGbXC51RzGea8N83oEJS
 1KVUtQxrkDxgrW/WLSl/TfqHFsJpdEFOv1XubWbleun3uKPy0e5vZCd5UjZPkeNjnqfCYTDy
 hVVsdOuFbtWDppJyJrThLqr9AgSFmoCNNUt1SVpYEEOLNE6C32BhlnSq21VLC+YXTgO/ZHTa
 YXkq54hHj63jwrcjkBSCkXLh37kHeqnl++GHpN+3R+o3w2OpwHAlvVjdKPT27v1tVkiydsFG
 65Vd0n3m/ft+IOrGgxQM1C20uqKvsZGB4r3OGR50ekAybO7sjEJJ1Obl4ge/6RRqcvKz4LMb
 tGs85D6tPIeFzsBNBFs50uABCADGJj+DP1fk+UWOWrf4O61HTbC4Vr9QD2K4fUUHnzg2B6zU
 R1BPXqLGG0+lzK8kfYU/F5RjmEcClsIkAaFkg4kzKP14tvY1J5+AV3yNqcdg018HNtiyrSwI
 E0Yz/qm1Ot2NMZ0DdvVBg22IMsiudQ1tx9CH9mtyTbIXgACvl3PW2o9CxiHPE/bohFhwZwh/
 kXYYAE51lhinQ3oFEeQZA3w4OTvxSEspiQR8dg8qJJb+YOAc5IKk6sJmmM7JfFMWSr22satM
 23oQ3WvJb4RV6HTRTAIEyyZS7g2DhiytgMG60t0qdABG5KXSQW+OKlZRpuWwKWaLh3if/p/u
 69dvpanbABEBAAHCwHwEGAEIACYWIQRyF/usjOnPY0ShaOVoDcEdUwt6IwUCWznS4AIbDAUJ
 A8JnAAAKCRBoDcEdUwt6I6X3CACJ8D+TpXBCqJE5xwog08+Dp8uBpx0T9n1wE0GQisZruACW
 NofYn8PTX9k4wmegDLwt7YQDdKxQ4+eTfZeLNQqWg6OCftH5Kx7sjWnJ09tOgniVdROzWJ7c
 VJ/i0okazncsJ+nq48UYvRGE1Swh3A4QRIyphWX4OADOBmTFl9ZYNPnh23eaC9WrNvFr7yP7
 iGjMlfEW8l6Lda//EC5VpXVNza0xeae0zFNst2R9pn+bLkihwDLWxOIyifGRxTqNxoS4I1aw
 VhxPSVztPMSpIA/sOr/N/p6JrBLn+gui2K6mP7bGb8hF+szfArYqz3T1rv1VzUWAJf5Wre5U
 iNx9uqqx
Message-ID: <9b03d145-ec50-927c-55a8-dff1cd51d655@suse.de>
Date: Sun, 30 Jun 2019 10:12:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <d6381c020ea1c848a7044d830bdb0ec9663d1619.1561735433.git.andrzej.p@collabora.com>
Content-Language: en-US
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
 =?UTF-8?Q?Heiko_St=c3=bcbner?= <heiko@sntech.de>,
 Sam Ravnborg <sam@ravnborg.org>, Neil Armstrong <narmstrong@baylibre.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Douglas Anderson <dianders@chromium.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>, kernel@collabora.com,
 Fabio Estevam <festevam@gmail.com>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 "David \(ChunMing\) Zhou" <David1.Zhou@amd.com>,
 linux-samsung-soc@vger.kernel.org, Joonyoung Shim <jy0922.shim@samsung.com>,
 linux-rockchip@lists.infradead.org, Vincent Abriou <vincent.abriou@st.com>,
 Rob Clark <robdclark@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, David Airlie <airlied@linux.ie>,
 Chen-Yu Tsai <wens@csie.org>, Kukjin Kim <kgene@kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>, CK Hu <ck.hu@mediatek.com>,
 Dave Airlie <airlied@redhat.com>, linux-tegra@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Jonas Karlman <jonas@kwiboo.se>, linux-arm-msm@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Jyri Sarha <jsarha@ti.com>, Inki Dae <inki.dae@samsung.com>,
 Mamta Shukla <mamtashukla555@gmail.com>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Thomas Gleixner <tglx@linutronix.de>, Sean Paul <sean@poorly.run>,
 linux-arm-kernel@lists.infradead.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 amd-gfx@lists.freedesktop.org, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Eric Anholt <eric@anholt.net>, freedreno@lists.freedesktop.org,
 Seung-Woo Kim <sw0312.kim@samsung.com>, Sandy Huang <hjc@rock-chips.com>,
 linux-kernel@vger.kernel.org, Todor Tomov <todor.tomov@linaro.org>,
 Kyungmin Park <kyungmin.park@samsung.com>, Huang Rui <ray.huang@amd.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Alex Deucher <alexander.deucher@amd.com>, Shawn Guo <shawnguo@kernel.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

SGkKCkkgbGlrZSB0aGUgaWRlYSwgYnV0IHdvdWxkIHByZWZlciBhIG1vcmUgc3RydWN0dXJlZCBh
cHByb2FjaC4KClNldHRpbmcgY29ubmVjdG9yLT5kZGMgYmVmb3JlIGNhbGxpbmcgZHJtX3N5c2Zz
X2Nvbm5lY3Rvcl9hZGQoKSBzZWVtcwplcnJvciBwcm9uZS4gVGhlIGRlcGVuZGVuY3kgaXMgbm90
IHJlYWxseSBjbGVhciBmcm9tIHRoZSBjb2RlIG9yIGludGVyZmFjZXMuCgpUaGUgb3RoZXIgdGhp
bmcgaXMgdGhhdCBkcml2ZXJzIEkgbW9zdGx5IHdvcmsgb24sIGFzdCBhbmQgbWdhZzIwMCwgaGF2
ZQpjb2RlIGxpa2UgdGhpczoKCiAgc3RydWN0IGFzdF9pMmNfY2hhbiB7CglzdHJ1Y3QgaTJjX2Fk
YXB0ZXIgYWRhcHRlcjsKCXN0cnVjdCBkcm1fZGV2aWNlICpkZXY7CglzdHJ1Y3QgaTJjX2FsZ29f
Yml0X2RhdGEgYml0OwogIH07CgogIHN0cnVjdCBhc3RfY29ubmVjdG9yIHsKCXN0cnVjdCBkcm1f
Y29ubmVjdG9yIGJhc2U7CglzdHJ1Y3QgYXN0X2kyY19jaGFuICppMmM7CiAgfTsKCkl0IGFscmVh
ZHkgZW5jb2RlcyB0aGUgY29ubmVjdGlvbiBiZXR3ZWVuIGNvbm5lY3RvciBhbmQgZGRjIGFkYXB0
ZXIuCgpJIHN1Z2dlc3QgdG8gaW50cm9kdWNlIHN0cnVjdCBkcm1faTJjX2FkYXB0ZXIKCiAgc3Ry
dWN0IGRybV9pMmNfYWRhcHRlciB7CglzdHJ1Y3QgaTJjX2FkYXB0ZXIgYmFzZTsKCXN0cnVjdCBk
cm1fY29ubmVjdG9yICpjb25uZWN0b3I7CiAgfTsKCmFuZCBjb252ZXJ0IGRyaXZlcnMgb3ZlciB0
byBpdC4gQXN0IHdvdWxkIGxvb2sgbGlrZSB0aGlzOgoKICBzdHJ1Y3QgYXN0X2kyY19jaGFuIHsK
CXN0cnVjdCBkcm1faTJjX2FkYXB0ZXIgYWRhcHRlcjsKCXN0cnVjdCBpMmNfYWxnb19iaXRfZGF0
YSBiaXQ7CiAgfTsKClR3byBuZXcgc3lzZnMgZnVuY3Rpb25zIHdvdWxkIHNldCB1cCBhbmQgcmVt
b3ZlIHRoZSBmaWxlLgoKICBpbnQgZHJtX3N5c2ZzX2kyY19hZGFwdGVyX2FkZChzdHJ1Y3QgZHJt
X2kyY19hZGFwdGVyICppMmMpOwogIHZvaWQgZHJtX3N5c2ZzX2kyY19hZGFwdGVyX3JlbW92ZShz
dHJ1Y3QgZHJtX2kyY19hZGFwdGVyICppMmMpOwoKVGhlIGkyYyBhZGFwdGVyLCBjb25uZWN0b3It
PmRkYyBwb2ludGVyIGFuZCBzeXNmcyBlbnRyeSB3b3VsZCBiZQppbml0aWFsaXplZCBieQoKICBk
cm1faTJjX2FkYXB0ZXJfaW5pdChzdHJ1Y3QgZHJtX2kyY19hZGFwdGVyICppMmMsIHN0cnVjdCBj
b25uZWN0b3IKCSpjb25uZWN0b3IsIHZvaWQgKmFsZ29fZGF0YSk7CgphbmQgY2xlYW5lZCB1cCBi
eQoKICBkcm1faTJjX2FkYXB0ZXJfcmVtb3ZlKHN0cnVjdCBkcm1faTJjX2FkYXB0ZXIgKmkyYyk7
CgoKVGhvdWdodHM/CgpCZXN0IHJlZ2FyZHMKVGhvbWFzCgpBbSAyOC4wNi4xOSB1bSAxODowMSBz
Y2hyaWViIEFuZHJ6ZWogUGlldHJhc2lld2ljejoKPiBBZGQgZ2VuZXJpYyBjb2RlIHdoaWNoIGNy
ZWF0ZXMgc3ltYm9saWMgbGlua3MgaW4gc3lzZnMsIHBvaW50aW5nIHRvIGRkYwo+IGludGVyZmFj
ZSB1c2VkIGJ5IGEgcGFydGljdWxhciB2aWRlbyBvdXRwdXQuIEZvciBleGFtcGxlOgo+IAo+IGxz
IC1sIC9zeXMvY2xhc3MvZHJtL2NhcmQwLUhETUktQS0xL2RkYwo+IGxyd3hyd3hyd3ggMSByb290
IHJvb3QgMCBKdW4gMjQgMTA6NDIgL3N5cy9jbGFzcy9kcm0vY2FyZDAtSERNSS1BLTEvZGRjIFwK
PiAJLT4gLi4vLi4vLi4vLi4vc29jLzEzODgwMDAwLmkyYy9pMmMtMgo+IAo+IFRoaXMgbWFrZXMg
aXQgZWFzeSBmb3IgdXNlciB0byBhc3NvY2lhdGUgYSBkaXNwbGF5IHdpdGggaXRzIGRkYyBhZGFw
dGVyCj4gYW5kIHVzZSBlLmcuIGRkY3V0aWwgdG8gY29udHJvbCB0aGUgY2hvc2VuIG1vbml0b3Iu
Cj4gCj4gVGhpcyBwYXRjaCBhZGRzIGFuIGkyY19hZGFwdGVyIHBvaW50ZXIgdG8gc3RydWN0IGRy
bV9jb25uZWN0b3IuIFBhcnRpY3VsYXIKPiBkcml2ZXJzIGNhbiB0aGVuIHVzZSBpdCBpbnN0ZWFk
IG9mIHVzaW5nIHRoZWlyIG93biBwcml2YXRlIGluc3RhbmNlLiBJZiBhCj4gY29ubmVjdG9yIGNv
bnRhaW5zIGEgZGRjLCB0aGVuIGNyZWF0ZSBhIHN5bWJvbGljIGxpbmsgaW4gc3lzZnMuCj4gCj4g
U2lnbmVkLW9mZi1ieTogQW5kcnplaiBQaWV0cmFzaWV3aWN6IDxhbmRyemVqLnBAY29sbGFib3Jh
LmNvbT4KPiBBY2tlZC1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4K
PiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2RybV9zeXNmcy5jIHwgIDcgKysrKysrKwo+ICBpbmNs
dWRlL2RybS9kcm1fY29ubmVjdG9yLmggfCAxMSArKysrKysrKysrKwo+ICAyIGZpbGVzIGNoYW5n
ZWQsIDE4IGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2Ry
bV9zeXNmcy5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9zeXNmcy5jCj4gaW5kZXggYWQxMDgxMGJj
OTcyLi4yNmQzNTliMzk3ODUgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9zeXNm
cy5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9zeXNmcy5jCj4gQEAgLTI5NCw2ICsyOTQs
OSBAQCBpbnQgZHJtX3N5c2ZzX2Nvbm5lY3Rvcl9hZGQoc3RydWN0IGRybV9jb25uZWN0b3IgKmNv
bm5lY3RvcikKPiAgCS8qIExldCB1c2Vyc3BhY2Uga25vdyB3ZSBoYXZlIGEgbmV3IGNvbm5lY3Rv
ciAqLwo+ICAJZHJtX3N5c2ZzX2hvdHBsdWdfZXZlbnQoZGV2KTsKPiAgCj4gKwlpZiAoY29ubmVj
dG9yLT5kZGMpCj4gKwkJcmV0dXJuIHN5c2ZzX2NyZWF0ZV9saW5rKCZjb25uZWN0b3ItPmtkZXYt
PmtvYmosCj4gKwkJCQkgJmNvbm5lY3Rvci0+ZGRjLT5kZXYua29iaiwgImRkYyIpOwo+ICAJcmV0
dXJuIDA7Cj4gIH0KPiAgCj4gQEAgLTMwMSw2ICszMDQsMTAgQEAgdm9pZCBkcm1fc3lzZnNfY29u
bmVjdG9yX3JlbW92ZShzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yKQo+ICB7Cj4gIAlp
ZiAoIWNvbm5lY3Rvci0+a2RldikKPiAgCQlyZXR1cm47Cj4gKwo+ICsJaWYgKGNvbm5lY3Rvci0+
ZGRjKQo+ICsJCXN5c2ZzX3JlbW92ZV9saW5rKCZjb25uZWN0b3ItPmtkZXYtPmtvYmosICJkZGMi
KTsKPiArCj4gIAlEUk1fREVCVUcoInJlbW92aW5nIFwiJXNcIiBmcm9tIHN5c2ZzXG4iLAo+ICAJ
CSAgY29ubmVjdG9yLT5uYW1lKTsKPiAgCj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL2RybV9j
b25uZWN0b3IuaCBiL2luY2x1ZGUvZHJtL2RybV9jb25uZWN0b3IuaAo+IGluZGV4IGNhNzQ1ZDlm
ZWFmNS4uMWFkM2QxZDU0YmE3IDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUvZHJtL2RybV9jb25uZWN0
b3IuaAo+ICsrKyBiL2luY2x1ZGUvZHJtL2RybV9jb25uZWN0b3IuaAo+IEBAIC0yMyw2ICsyMyw3
IEBACj4gICNpZm5kZWYgX19EUk1fQ09OTkVDVE9SX0hfXwo+ICAjZGVmaW5lIF9fRFJNX0NPTk5F
Q1RPUl9IX18KPiAgCj4gKyNpbmNsdWRlIDxsaW51eC9pMmMuaD4KPiAgI2luY2x1ZGUgPGxpbnV4
L2xpc3QuaD4KPiAgI2luY2x1ZGUgPGxpbnV4L2xsaXN0Lmg+Cj4gICNpbmNsdWRlIDxsaW51eC9j
dHlwZS5oPgo+IEBAIC0xMzA4LDYgKzEzMDksMTYgQEAgc3RydWN0IGRybV9jb25uZWN0b3Igewo+
ICAJICogWzBdOiBwcm9ncmVzc2l2ZSwgWzFdOiBpbnRlcmxhY2VkCj4gIAkgKi8KPiAgCWludCBh
dWRpb19sYXRlbmN5WzJdOwo+ICsKPiArCS8qKgo+ICsJICogQGRkYzogYXNzb2NpYXRlZCBkZGMg
YWRhcHRlci4KPiArCSAqIEEgY29ubmVjdG9yIHVzdWFsbHkgaGFzIGl0cyBhc3NvY2lhdGVkIGRk
YyBhZGFwdGVyLiBJZiBhIGRyaXZlciB1c2VzCj4gKwkgKiB0aGlzIGZpZWxkLCB0aGVuIGFuIGFw
cHJvcHJpYXRlIHN5bWJvbGljIGxpbmsgaXMgY3JlYXRlZCBpbiBjb25uZWN0b3IKPiArCSAqIHN5
c2ZzIGRpcmVjdG9yeSB0byBtYWtlIGl0IGVhc3kgZm9yIHRoZSB1c2VyIHRvIHRlbGwgd2hpY2gg
aTJjCj4gKwkgKiBhZGFwdGVyIGlzIGZvciBhIHBhcnRpY3VsYXIgZGlzcGxheS4KPiArCSAqLwo+
ICsJc3RydWN0IGkyY19hZGFwdGVyICpkZGM7Cj4gKwo+ICAJLyoqCj4gIAkgKiBAbnVsbF9lZGlk
X2NvdW50ZXI6IHRyYWNrIHNpbmtzIHRoYXQgZ2l2ZSB1cyBhbGwgemVyb3MgZm9yIHRoZSBFRElE
Lgo+ICAJICogTmVlZGVkIHRvIHdvcmthcm91bmQgc29tZSBIVyBidWdzIHdoZXJlIHdlIGdldCBh
bGwgMHMKPiAKCi0tIApUaG9tYXMgWmltbWVybWFubgpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVy
ClNVU0UgTGludXggR21iSCwgTWF4ZmVsZHN0cmFzc2UgNSwgOTA0MDkgTnVlcm5iZXJnLCBHZXJt
YW55CkdGOiBGZWxpeCBJbWVuZMO2cmZmZXIsIE1hcnkgSGlnZ2lucywgU3JpIFJhc2lhaApIUkIg
MjEyODQgKEFHIE7DvHJuYmVyZykKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQt
Z2Z4
