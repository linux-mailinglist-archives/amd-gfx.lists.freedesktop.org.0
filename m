Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A713660277
	for <lists+amd-gfx@lfdr.de>; Fri,  5 Jul 2019 10:42:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BB5B6E44F;
	Fri,  5 Jul 2019 08:42:07 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E94218901F;
 Thu,  4 Jul 2019 13:17:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: andrzej.p) with ESMTPSA id 1FBA128AE27
Subject: Re: [PATCH v3 21/22] drm/amdgpu: Provide ddc symlink in connector
 sysfs directory
To: Alex Deucher <alexdeucher@gmail.com>
References: <3fb19371-db7d-f9dc-31a7-1ccd126f6784@collabora.com>
 <cover.1561735433.git.andrzej.p@collabora.com>
 <5e355b8bec8fb3907566a741db8cc3e356246a32.1561735433.git.andrzej.p@collabora.com>
 <CADnq5_MrVoScVFgj3TP2Z+Ky8_32k=Cou5jebuMT5gE1+GZ0cA@mail.gmail.com>
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Message-ID: <fc26ac17-dc18-f995-53cf-42b50754c916@collabora.com>
Date: Thu, 4 Jul 2019 15:17:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <CADnq5_MrVoScVFgj3TP2Z+Ky8_32k=Cou5jebuMT5gE1+GZ0cA@mail.gmail.com>
Content-Language: en-US
X-Mailman-Approved-At: Fri, 05 Jul 2019 08:42:04 +0000
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
 Neil Armstrong <narmstrong@baylibre.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Liviu Dudau <liviu.dudau@arm.com>,
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
 Alexios Zavras <alexios.zavras@intel.com>,
 Mamta Shukla <mamtashukla555@gmail.com>, linux-mediatek@lists.infradead.org,
 linux-tegra@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 Vincent Abriou <vincent.abriou@st.com>,
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
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VyBkbml1IDAyLjA3LjIwMTkgb8KgMjI6NTQsIEFsZXggRGV1Y2hlciBwaXN6ZToKPiBPbiBGcmks
IEp1biAyOCwgMjAxOSBhdCAxMjozMSBQTSBBbmRyemVqIFBpZXRyYXNpZXdpY3oKPiA8YW5kcnpl
ai5wQGNvbGxhYm9yYS5jb20+IHdyb3RlOgo+Pgo+PiBVc2UgdGhlIGRkYyBwb2ludGVyIHByb3Zp
ZGVkIGJ5IHRoZSBnZW5lcmljIGNvbm5lY3Rvci4KPj4KPj4gU2lnbmVkLW9mZi1ieTogQW5kcnpl
aiBQaWV0cmFzaWV3aWN6IDxhbmRyemVqLnBAY29sbGFib3JhLmNvbT4KPj4gLS0tCj4+ICAgLi4u
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfY29ubmVjdG9ycy5jICAgIHwgNzAgKysrKysrKysr
KysrKystLS0tLQo+PiAgIDEgZmlsZSBjaGFuZ2VkLCA1MSBpbnNlcnRpb25zKCspLCAxOSBkZWxl
dGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV9jb25uZWN0b3JzLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfY29u
bmVjdG9ycy5jCj4+IGluZGV4IDczYjJlZGU3NzNkMy4uNWY4YTdlMzgxOGI5IDEwMDY0NAo+PiAt
LS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfY29ubmVjdG9ycy5jCj4+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9jb25uZWN0b3JzLmMKPj4gQEAg
LTE1NzMsMTEgKzE1NzMsMTUgQEAgYW1kZ3B1X2Nvbm5lY3Rvcl9hZGQoc3RydWN0IGFtZGdwdV9k
ZXZpY2UgKmFkZXYsCj4+ICAgICAgICAgICAgICAgICAgICAgICAgICBnb3RvIGZhaWxlZDsKPj4g
ICAgICAgICAgICAgICAgICBhbWRncHVfY29ubmVjdG9yLT5jb25fcHJpdiA9IGFtZGdwdV9kaWdf
Y29ubmVjdG9yOwo+PiAgICAgICAgICAgICAgICAgIGlmIChpMmNfYnVzLT52YWxpZCkgewo+PiAt
ICAgICAgICAgICAgICAgICAgICAgICBhbWRncHVfY29ubmVjdG9yLT5kZGNfYnVzID0gYW1kZ3B1
X2kyY19sb29rdXAoYWRldiwgaTJjX2J1cyk7Cj4+IC0gICAgICAgICAgICAgICAgICAgICAgIGlm
IChhbWRncHVfY29ubmVjdG9yLT5kZGNfYnVzKQo+PiArICAgICAgICAgICAgICAgICAgICAgICBz
dHJ1Y3QgYW1kZ3B1X2Nvbm5lY3RvciAqYWNuID0gYW1kZ3B1X2Nvbm5lY3RvcjsKPj4gKwo+PiAr
ICAgICAgICAgICAgICAgICAgICAgICBhY24tPmRkY19idXMgPSBhbWRncHVfaTJjX2xvb2t1cChh
ZGV2LCBpMmNfYnVzKTsKPj4gKyAgICAgICAgICAgICAgICAgICAgICAgaWYgKGFjbi0+ZGRjX2J1
cykgewo+IAo+IFRoaXMgaHVuayBzZWVtcyBwb2ludGxlc3MgdW5sZXNzIEknbSBtaXNzaW5nIHNv
bWV0aGluZy4gIENhbiB5b3UgZHJvcAo+IHRoaXMgaHVuaz8gIFNhbWUgY29tbWVudCBvbiBlYWNo
IGluc3RhbmNlIG9mIHRoaXMgYmVsb3cuICBUaGlzIGFsc28KPiBvbmx5IGNvdmVycyB0aGUgbGVn
YWN5IG1vZGVzZXR0aW5nIGNvZGUgd2hpY2ggaXMgbm90IHVzZWQgYnkgZGVmYXVsdAo+IG9uIG1v
c3QgY2hpcHMuICBUaGUgREMgY29kZSBpbiBhbWQvZGlzcGxheS8gaXMgcHJvYmFibHkgbW9yZSBy
ZWxldmFudC4KPiAKCklmIEkgZG9uJ3QgZG8gdGhhdCBjaGVja3BhdGNoIHJlcG9ydHMgdGhhdCBs
aW5lcyBJIGNyZWF0ZWQgZXhjZWVkIDgwIGNoYXJhY3RlcnMuCgpBbmRyemVqCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0
CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
