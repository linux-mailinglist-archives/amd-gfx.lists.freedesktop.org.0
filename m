Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E0C05E9A81
	for <lists+amd-gfx@lfdr.de>; Mon, 26 Sep 2022 09:33:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1340B10E5C8;
	Mon, 26 Sep 2022 07:33:44 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from smtpfallback03.a1.net (smtpfallback03.a1.net [194.48.128.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACB7C10E440;
 Sun, 25 Sep 2022 20:48:56 +0000 (UTC)
Received: from smtpout07.a1.net (unknown [10.247.84.37])
 by smtpfallback03.a1.net (Postfix) with ESMTPS id 4MbHzq2ByYzYkmKS;
 Sun, 25 Sep 2022 22:48:55 +0200 (CEST)
Received: from [10.189.8.1] (213-225-37-116.nat.highway.a1.net
 [213.225.37.116])
 by smtpout07.a1.net (Postfix) with ESMTPA id 4MbHzZ5lvszGrqp0;
 Sun, 25 Sep 2022 22:48:42 +0200 (CEST)
SavedFromEmail: cco@aon.at
Date: Sun, 25 Sep 2022 22:48:41 +0200
Subject: =?US-ASCII?Q?Re:_[PATCH_v4_09/21]_drm/etnaviv:_Prepare?=
 =?US-ASCII?Q?_to_dynamic_dma-buf_locking=0D__specification?=
In-Reply-To: <641f372f-4a30-72bb-ec8b-4fd6ff825594@amd.com>
Importance: normal
From: cco <cco@aon.at>
To: =?ISO-8859-1?Q?Christian_K=F6nig?= <christian.koenig@amd.com>, Dmitry
 Osipenko <dmitry.osipenko@collabora.com>, David Airlie <airlied@linux.ie>,
 Gerd Hoffmann <kraxel@redhat.com>, Gurchetan Singh
 <gurchetansingh@chromium.org>, Chia-I Wu <olvaffe@gmail.com>, Daniel Vetter
 <daniel@ffwll.ch>, Daniel Almeida <daniel.almeida@collabora.com>, Gert
 Wollny <gert.wollny@collabora.com>, Gustavo Padovan
 <gustavo.padovan@collabora.com>, Daniel Stone <daniel@fooishbar.org>, Tomeu
 Vizoso <tomeu.vizoso@collabora.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Clark <robdclark@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Thierry Reding <thierry.reding@gmail.com>, Tomasz Figa
 <tfiga@chromium.org>, Marek Szyprowski <m.szyprowski@samsung.com>, Mauro
 Carvalho Chehab <mchehab@kernel.org>, Alex Deucher
 <alexander.deucher@amd.com>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 =?ISO-8859-1?Q?Thomas_Hellstr=F6m?= <thomas_os@shipmail.org>, Qiang Yu
 <yuq825@gmail.com>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Amol Maheshwari <amahesh@qti.qualcomm.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Leon Romanovsky <leon@kernel.org>, Juergen Gross <jgross@suse.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Oleksandr Tyshchenko
 <oleksandr_tyshchenko@epam.com>, Tomi Valkeinen <tomba@kernel.org>, Russell
 King <linux@armlinux.org.uk>, Lucas Stach <l.stach@pengutronix.de>,
 Christian Gmeiner <christian.gmeiner@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/alternative;
 boundary="--_com.samsung.android.email_62562235527170"
X-Spam-Level: 
X-Mailman-Approved-At: Mon, 26 Sep 2022 07:33:28 +0000
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
Cc: linux-rdma@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 Dmitry Osipenko <digetx@gmail.com>, kernel@collabora.com,
 linux-media@vger.kernel.org
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>
Message-Id: <20220926073344.1340B10E5C8@gabe.freedesktop.org>

----_com.samsung.android.email_62562235527170
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: base64

VG8gd2hvb20gaXQgbWF5IGJlbG9uZzogRGVlcGVzdCBzb3Jyb3cgdG8gaW5mb3JtIHlvdSB0aGF0
IG15IGh1c2JhbmQgSGVsbXV0IHBhc3NlZCBieSBvbiBKdWx5IDIxLiBUaGlzIGFjY2VzcyB3aWxs
IGJlIGNsZWFyZWQgaW4gYSB2aWV3IGRheXMuwqBJcmVuZQotLS0tLS0tLSBVcnNwcsO8bmdsaWNo
ZSBOYWNocmljaHQgLS0tLS0tLS1Wb246IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2Vu
aWdAYW1kLmNvbT4gRGF0dW06IDAxLjA5LjIyICAwODo1MCAgKEdNVCswMTowMCkgQW46IERtaXRy
eSBPc2lwZW5rbyA8ZG1pdHJ5Lm9zaXBlbmtvQGNvbGxhYm9yYS5jb20+LCBEYXZpZCBBaXJsaWUg
PGFpcmxpZWRAbGludXguaWU+LCBHZXJkIEhvZmZtYW5uIDxrcmF4ZWxAcmVkaGF0LmNvbT4sIEd1
cmNoZXRhbiBTaW5naCA8Z3VyY2hldGFuc2luZ2hAY2hyb21pdW0ub3JnPiwgQ2hpYS1JIFd1IDxv
bHZhZmZlQGdtYWlsLmNvbT4sIERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4sIERhbmll
bCBBbG1laWRhIDxkYW5pZWwuYWxtZWlkYUBjb2xsYWJvcmEuY29tPiwgR2VydCBXb2xsbnkgPGdl
cnQud29sbG55QGNvbGxhYm9yYS5jb20+LCBHdXN0YXZvIFBhZG92YW4gPGd1c3Rhdm8ucGFkb3Zh
bkBjb2xsYWJvcmEuY29tPiwgRGFuaWVsIFN0b25lIDxkYW5pZWxAZm9vaXNoYmFyLm9yZz4sIFRv
bWV1IFZpem9zbyA8dG9tZXUudml6b3NvQGNvbGxhYm9yYS5jb20+LCBNYWFydGVuIExhbmtob3Jz
dCA8bWFhcnRlbi5sYW5raG9yc3RAbGludXguaW50ZWwuY29tPiwgTWF4aW1lIFJpcGFyZCA8bXJp
cGFyZEBrZXJuZWwub3JnPiwgVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+
LCBSb2IgQ2xhcmsgPHJvYmRjbGFya0BnbWFpbC5jb20+LCBTdW1pdCBTZW13YWwgPHN1bWl0LnNl
bXdhbEBsaW5hcm8ub3JnPiwgIlBhbiwgWGluaHVpIiA8WGluaHVpLlBhbkBhbWQuY29tPiwgVGhp
ZXJyeSBSZWRpbmcgPHRoaWVycnkucmVkaW5nQGdtYWlsLmNvbT4sIFRvbWFzeiBGaWdhIDx0Zmln
YUBjaHJvbWl1bS5vcmc+LCBNYXJlayBTenlwcm93c2tpIDxtLnN6eXByb3dza2lAc2Ftc3VuZy5j
b20+LCBNYXVybyBDYXJ2YWxobyBDaGVoYWIgPG1jaGVoYWJAa2VybmVsLm9yZz4sIEFsZXggRGV1
Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4sIEphbmkgTmlrdWxhIDxqYW5pLm5pa3Vs
YUBsaW51eC5pbnRlbC5jb20+LCBKb29uYXMgTGFodGluZW4gPGpvb25hcy5sYWh0aW5lbkBsaW51
eC5pbnRlbC5jb20+LCBSb2RyaWdvIFZpdmkgPHJvZHJpZ28udml2aUBpbnRlbC5jb20+LCBUdnJ0
a28gVXJzdWxpbiA8dHZydGtvLnVyc3VsaW5AbGludXguaW50ZWwuY29tPiwgVGhvbWFzIEhlbGxz
dHLDtm0gPHRob21hc19vc0BzaGlwbWFpbC5vcmc+LCBRaWFuZyBZdSA8eXVxODI1QGdtYWlsLmNv
bT4sIFNyaW5pdmFzIEthbmRhZ2F0bGEgPHNyaW5pdmFzLmthbmRhZ2F0bGFAbGluYXJvLm9yZz4s
IEFtb2wgTWFoZXNod2FyaSA8YW1haGVzaEBxdGkucXVhbGNvbW0uY29tPiwgSmFzb24gR3VudGhv
cnBlIDxqZ2dAemllcGUuY2E+LCBMZW9uIFJvbWFub3Zza3kgPGxlb25Aa2VybmVsLm9yZz4sIEp1
ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4sIFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJl
bGxpbmlAa2VybmVsLm9yZz4sIE9sZWtzYW5kciBUeXNoY2hlbmtvIDxvbGVrc2FuZHJfdHlzaGNo
ZW5rb0BlcGFtLmNvbT4sIFRvbWkgVmFsa2VpbmVuIDx0b21iYUBrZXJuZWwub3JnPiwgUnVzc2Vs
bCBLaW5nIDxsaW51eEBhcm1saW51eC5vcmcudWs+LCBMdWNhcyBTdGFjaCA8bC5zdGFjaEBwZW5n
dXRyb25peC5kZT4sIENocmlzdGlhbiBHbWVpbmVyIDxjaHJpc3RpYW4uZ21laW5lckBnbWFpbC5j
b20+IENjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnLCBsaW51eC1rZXJuZWxAdmdl
ci5rZXJuZWwub3JnLCBEbWl0cnkgT3NpcGVua28gPGRpZ2V0eEBnbWFpbC5jb20+LCBsaW51eC1t
ZWRpYUB2Z2VyLmtlcm5lbC5vcmcsIGxpbmFyby1tbS1zaWdAbGlzdHMubGluYXJvLm9yZywgYW1k
LWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcsIGludGVsLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcsIGtlcm5lbEBjb2xsYWJvcmEuY29tLCB2aXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3Vu
ZGF0aW9uLm9yZywgbGludXgtcmRtYUB2Z2VyLmtlcm5lbC5vcmcsIGxpbnV4LWFybS1tc21Admdl
ci5rZXJuZWwub3JnIEJldHJlZmY6IFJlOiBbUEFUQ0ggdjQgMDkvMjFdIGRybS9ldG5hdml2OiBQ
cmVwYXJlIHRvIGR5bmFtaWMgZG1hLWJ1ZiBsb2NraW5nCiAgc3BlY2lmaWNhdGlvbiBBbSAzMS4w
OC4yMiB1bSAxNzozNyBzY2hyaWViIERtaXRyeSBPc2lwZW5rbzo+IFByZXBhcmUgRXRuYXZpdiBk
cml2ZXIgdG8gdGhlIGNvbW1vbiBkeW5hbWljIGRtYS1idWYgbG9ja2luZyBjb252ZW50aW9uPiBi
eSBzdGFydGluZyB0byB1c2UgdGhlIHVubG9ja2VkIHZlcnNpb25zIG9mIGRtYS1idWYgQVBJIGZ1
bmN0aW9ucy4+PiBTaWduZWQtb2ZmLWJ5OiBEbWl0cnkgT3NpcGVua28gPGRtaXRyeS5vc2lwZW5r
b0Bjb2xsYWJvcmEuY29tPkludGVyZXN0aW5nLCB3aGVyZSBpcyB0aGUgbWF0Y2hpbmcgdm1hcCgp
P0FueXdheSwgdGhpcyBwYXRjaCBpcyBBY2tlZC1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0
aWFuLmtvZW5pZ0BhbWQuY29tPj4gLS0tPsKgwqAgZHJpdmVycy9ncHUvZHJtL2V0bmF2aXYvZXRu
YXZpdl9nZW1fcHJpbWUuYyB8IDIgKy0+wqDCoCAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24o
KyksIDEgZGVsZXRpb24oLSk+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2V0bmF2aXYv
ZXRuYXZpdl9nZW1fcHJpbWUuYyBiL2RyaXZlcnMvZ3B1L2RybS9ldG5hdml2L2V0bmF2aXZfZ2Vt
X3ByaW1lLmM+IGluZGV4IDNmYTJkYTE0OTYzOS4uNzAzMWRiMTQ1YTc3IDEwMDY0ND4gLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2V0bmF2aXYvZXRuYXZpdl9nZW1fcHJpbWUuYz4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2V0bmF2aXYvZXRuYXZpdl9nZW1fcHJpbWUuYz4gQEAgLTY1LDcgKzY1LDcgQEAg
c3RhdGljIHZvaWQgZXRuYXZpdl9nZW1fcHJpbWVfcmVsZWFzZShzdHJ1Y3QgZXRuYXZpdl9nZW1f
b2JqZWN0ICpldG5hdml2X29iaik+wqDCoCAJc3RydWN0IGlvc3lzX21hcCBtYXAgPSBJT1NZU19N
QVBfSU5JVF9WQUREUihldG5hdml2X29iai0+dmFkZHIpOz7CoMKgID7CoMKgIAlpZiAoZXRuYXZp
dl9vYmotPnZhZGRyKT4gLQkJZG1hX2J1Zl92dW5tYXAoZXRuYXZpdl9vYmotPmJhc2UuaW1wb3J0
X2F0dGFjaC0+ZG1hYnVmLCAmbWFwKTs+ICsJCWRtYV9idWZfdnVubWFwX3VubG9ja2VkKGV0bmF2
aXZfb2JqLT5iYXNlLmltcG9ydF9hdHRhY2gtPmRtYWJ1ZiwgJm1hcCk7PsKgwqAgPsKgwqAgCS8q
IERvbid0IGRyb3AgdGhlIHBhZ2VzIGZvciBpbXBvcnRlZCBkbWFidWYsIGFzIHRoZXkgYXJlIG5v
dD7CoMKgIAkgKiBvdXJzLCBqdXN0IGZyZWUgdGhlIGFycmF5IHdlIGFsbG9jYXRlZDo=

----_com.samsung.android.email_62562235527170
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: base64

PGh0bWw+PGhlYWQ+PG1ldGEgaHR0cC1lcXVpdj0iQ29udGVudC1UeXBlIiBjb250ZW50PSJ0ZXh0
L2h0bWw7IGNoYXJzZXQ9VVRGLTgiPjwvaGVhZD48Ym9keSBkaXI9ImF1dG8iPlRvIHdob29tIGl0
IG1heSBiZWxvbmc6IERlZXBlc3Qgc29ycm93IHRvIGluZm9ybSB5b3UgdGhhdCBteSBodXNiYW5k
IEhlbG11dCBwYXNzZWQgYnkgb24gSnVseSAyMS4gVGhpcyBhY2Nlc3Mgd2lsbCBiZSBjbGVhcmVk
IGluIGEgdmlldyBkYXlzLiZuYnNwOzxkaXYgZGlyPSJhdXRvIj5JcmVuZTwvZGl2PjxkaXY+PGJy
PjwvZGl2PjxkaXYgYWxpZ249ImxlZnQiIGRpcj0iYXV0byIgc3R5bGU9ImZvbnQtc2l6ZToxMDAl
O2NvbG9yOiMwMDAwMDAiPjxkaXY+LS0tLS0tLS0gVXJzcHLDvG5nbGljaGUgTmFjaHJpY2h0IC0t
LS0tLS0tPC9kaXY+PGRpdj5Wb246IENocmlzdGlhbiBLw7ZuaWcgJmx0O2NocmlzdGlhbi5rb2Vu
aWdAYW1kLmNvbSZndDsgPC9kaXY+PGRpdj5EYXR1bTogMDEuMDkuMjIgIDA4OjUwICAoR01UKzAx
OjAwKSA8L2Rpdj48ZGl2PkFuOiBEbWl0cnkgT3NpcGVua28gJmx0O2RtaXRyeS5vc2lwZW5rb0Bj
b2xsYWJvcmEuY29tJmd0OywgRGF2aWQgQWlybGllICZsdDthaXJsaWVkQGxpbnV4LmllJmd0Oywg
R2VyZCBIb2ZmbWFubiAmbHQ7a3JheGVsQHJlZGhhdC5jb20mZ3Q7LCBHdXJjaGV0YW4gU2luZ2gg
Jmx0O2d1cmNoZXRhbnNpbmdoQGNocm9taXVtLm9yZyZndDssIENoaWEtSSBXdSAmbHQ7b2x2YWZm
ZUBnbWFpbC5jb20mZ3Q7LCBEYW5pZWwgVmV0dGVyICZsdDtkYW5pZWxAZmZ3bGwuY2gmZ3Q7LCBE
YW5pZWwgQWxtZWlkYSAmbHQ7ZGFuaWVsLmFsbWVpZGFAY29sbGFib3JhLmNvbSZndDssIEdlcnQg
V29sbG55ICZsdDtnZXJ0LndvbGxueUBjb2xsYWJvcmEuY29tJmd0OywgR3VzdGF2byBQYWRvdmFu
ICZsdDtndXN0YXZvLnBhZG92YW5AY29sbGFib3JhLmNvbSZndDssIERhbmllbCBTdG9uZSAmbHQ7
ZGFuaWVsQGZvb2lzaGJhci5vcmcmZ3Q7LCBUb21ldSBWaXpvc28gJmx0O3RvbWV1LnZpem9zb0Bj
b2xsYWJvcmEuY29tJmd0OywgTWFhcnRlbiBMYW5raG9yc3QgJmx0O21hYXJ0ZW4ubGFua2hvcnN0
QGxpbnV4LmludGVsLmNvbSZndDssIE1heGltZSBSaXBhcmQgJmx0O21yaXBhcmRAa2VybmVsLm9y
ZyZndDssIFRob21hcyBaaW1tZXJtYW5uICZsdDt0emltbWVybWFubkBzdXNlLmRlJmd0OywgUm9i
IENsYXJrICZsdDtyb2JkY2xhcmtAZ21haWwuY29tJmd0OywgU3VtaXQgU2Vtd2FsICZsdDtzdW1p
dC5zZW13YWxAbGluYXJvLm9yZyZndDssICJQYW4sIFhpbmh1aSIgJmx0O1hpbmh1aS5QYW5AYW1k
LmNvbSZndDssIFRoaWVycnkgUmVkaW5nICZsdDt0aGllcnJ5LnJlZGluZ0BnbWFpbC5jb20mZ3Q7
LCBUb21hc3ogRmlnYSAmbHQ7dGZpZ2FAY2hyb21pdW0ub3JnJmd0OywgTWFyZWsgU3p5cHJvd3Nr
aSAmbHQ7bS5zenlwcm93c2tpQHNhbXN1bmcuY29tJmd0OywgTWF1cm8gQ2FydmFsaG8gQ2hlaGFi
ICZsdDttY2hlaGFiQGtlcm5lbC5vcmcmZ3Q7LCBBbGV4IERldWNoZXIgJmx0O2FsZXhhbmRlci5k
ZXVjaGVyQGFtZC5jb20mZ3Q7LCBKYW5pIE5pa3VsYSAmbHQ7amFuaS5uaWt1bGFAbGludXguaW50
ZWwuY29tJmd0OywgSm9vbmFzIExhaHRpbmVuICZsdDtqb29uYXMubGFodGluZW5AbGludXguaW50
ZWwuY29tJmd0OywgUm9kcmlnbyBWaXZpICZsdDtyb2RyaWdvLnZpdmlAaW50ZWwuY29tJmd0Oywg
VHZydGtvIFVyc3VsaW4gJmx0O3R2cnRrby51cnN1bGluQGxpbnV4LmludGVsLmNvbSZndDssIFRo
b21hcyBIZWxsc3Ryw7ZtICZsdDt0aG9tYXNfb3NAc2hpcG1haWwub3JnJmd0OywgUWlhbmcgWXUg
Jmx0O3l1cTgyNUBnbWFpbC5jb20mZ3Q7LCBTcmluaXZhcyBLYW5kYWdhdGxhICZsdDtzcmluaXZh
cy5rYW5kYWdhdGxhQGxpbmFyby5vcmcmZ3Q7LCBBbW9sIE1haGVzaHdhcmkgJmx0O2FtYWhlc2hA
cXRpLnF1YWxjb21tLmNvbSZndDssIEphc29uIEd1bnRob3JwZSAmbHQ7amdnQHppZXBlLmNhJmd0
OywgTGVvbiBSb21hbm92c2t5ICZsdDtsZW9uQGtlcm5lbC5vcmcmZ3Q7LCBKdWVyZ2VuIEdyb3Nz
ICZsdDtqZ3Jvc3NAc3VzZS5jb20mZ3Q7LCBTdGVmYW5vIFN0YWJlbGxpbmkgJmx0O3NzdGFiZWxs
aW5pQGtlcm5lbC5vcmcmZ3Q7LCBPbGVrc2FuZHIgVHlzaGNoZW5rbyAmbHQ7b2xla3NhbmRyX3R5
c2hjaGVua29AZXBhbS5jb20mZ3Q7LCBUb21pIFZhbGtlaW5lbiAmbHQ7dG9tYmFAa2VybmVsLm9y
ZyZndDssIFJ1c3NlbGwgS2luZyAmbHQ7bGludXhAYXJtbGludXgub3JnLnVrJmd0OywgTHVjYXMg
U3RhY2ggJmx0O2wuc3RhY2hAcGVuZ3V0cm9uaXguZGUmZ3Q7LCBDaHJpc3RpYW4gR21laW5lciAm
bHQ7Y2hyaXN0aWFuLmdtZWluZXJAZ21haWwuY29tJmd0OyA8L2Rpdj48ZGl2PkNjOiBkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnLCBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnLCBE
bWl0cnkgT3NpcGVua28gJmx0O2RpZ2V0eEBnbWFpbC5jb20mZ3Q7LCBsaW51eC1tZWRpYUB2Z2Vy
Lmtlcm5lbC5vcmcsIGxpbmFyby1tbS1zaWdAbGlzdHMubGluYXJvLm9yZywgYW1kLWdmeEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcsIGludGVsLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcsIGtlcm5l
bEBjb2xsYWJvcmEuY29tLCB2aXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9y
ZywgbGludXgtcmRtYUB2Z2VyLmtlcm5lbC5vcmcsIGxpbnV4LWFybS1tc21Admdlci5rZXJuZWwu
b3JnIDwvZGl2PjxkaXY+QmV0cmVmZjogUmU6IFtQQVRDSCB2NCAwOS8yMV0gZHJtL2V0bmF2aXY6
IFByZXBhcmUgdG8gZHluYW1pYyBkbWEtYnVmIGxvY2tpbmcKICBzcGVjaWZpY2F0aW9uIDwvZGl2
PjxkaXY+PGJyPjwvZGl2PjwvZGl2PkFtIDMxLjA4LjIyIHVtIDE3OjM3IHNjaHJpZWIgRG1pdHJ5
IE9zaXBlbmtvOjxicj4mZ3Q7IFByZXBhcmUgRXRuYXZpdiBkcml2ZXIgdG8gdGhlIGNvbW1vbiBk
eW5hbWljIGRtYS1idWYgbG9ja2luZyBjb252ZW50aW9uPGJyPiZndDsgYnkgc3RhcnRpbmcgdG8g
dXNlIHRoZSB1bmxvY2tlZCB2ZXJzaW9ucyBvZiBkbWEtYnVmIEFQSSBmdW5jdGlvbnMuPGJyPiZn
dDs8YnI+Jmd0OyBTaWduZWQtb2ZmLWJ5OiBEbWl0cnkgT3NpcGVua28gJmx0O2RtaXRyeS5vc2lw
ZW5rb0Bjb2xsYWJvcmEuY29tJmd0Ozxicj48YnI+SW50ZXJlc3RpbmcsIHdoZXJlIGlzIHRoZSBt
YXRjaGluZyB2bWFwKCk/PGJyPjxicj5Bbnl3YXksIHRoaXMgcGF0Y2ggaXMgQWNrZWQtYnk6IENo
cmlzdGlhbiBLw7ZuaWcgJmx0O2NocmlzdGlhbi5rb2VuaWdAYW1kLmNvbSZndDs8YnI+PGJyPiZn
dDsgLS0tPGJyPiZndDsmbmJzcDsmbmJzcDsgZHJpdmVycy9ncHUvZHJtL2V0bmF2aXYvZXRuYXZp
dl9nZW1fcHJpbWUuYyB8IDIgKy08YnI+Jmd0OyZuYnNwOyZuYnNwOyAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSk8YnI+Jmd0Ozxicj4mZ3Q7IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vZXRuYXZpdi9ldG5hdml2X2dlbV9wcmltZS5jIGIvZHJpdmVycy9n
cHUvZHJtL2V0bmF2aXYvZXRuYXZpdl9nZW1fcHJpbWUuYzxicj4mZ3Q7IGluZGV4IDNmYTJkYTE0
OTYzOS4uNzAzMWRiMTQ1YTc3IDEwMDY0NDxicj4mZ3Q7IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9l
dG5hdml2L2V0bmF2aXZfZ2VtX3ByaW1lLmM8YnI+Jmd0OyArKysgYi9kcml2ZXJzL2dwdS9kcm0v
ZXRuYXZpdi9ldG5hdml2X2dlbV9wcmltZS5jPGJyPiZndDsgQEAgLTY1LDcgKzY1LDcgQEAgc3Rh
dGljIHZvaWQgZXRuYXZpdl9nZW1fcHJpbWVfcmVsZWFzZShzdHJ1Y3QgZXRuYXZpdl9nZW1fb2Jq
ZWN0ICpldG5hdml2X29iaik8YnI+Jmd0OyZuYnNwOyZuYnNwOyAJc3RydWN0IGlvc3lzX21hcCBt
YXAgPSBJT1NZU19NQVBfSU5JVF9WQUREUihldG5hdml2X29iai0mZ3Q7dmFkZHIpOzxicj4mZ3Q7
Jm5ic3A7Jm5ic3A7IDxicj4mZ3Q7Jm5ic3A7Jm5ic3A7IAlpZiAoZXRuYXZpdl9vYmotJmd0O3Zh
ZGRyKTxicj4mZ3Q7IC0JCWRtYV9idWZfdnVubWFwKGV0bmF2aXZfb2JqLSZndDtiYXNlLmltcG9y
dF9hdHRhY2gtJmd0O2RtYWJ1ZiwgJmFtcDttYXApOzxicj4mZ3Q7ICsJCWRtYV9idWZfdnVubWFw
X3VubG9ja2VkKGV0bmF2aXZfb2JqLSZndDtiYXNlLmltcG9ydF9hdHRhY2gtJmd0O2RtYWJ1Ziwg
JmFtcDttYXApOzxicj4mZ3Q7Jm5ic3A7Jm5ic3A7IDxicj4mZ3Q7Jm5ic3A7Jm5ic3A7IAkvKiBE
b24ndCBkcm9wIHRoZSBwYWdlcyBmb3IgaW1wb3J0ZWQgZG1hYnVmLCBhcyB0aGV5IGFyZSBub3Q8
YnI+Jmd0OyZuYnNwOyZuYnNwOyAJICogb3VycywganVzdCBmcmVlIHRoZSBhcnJheSB3ZSBhbGxv
Y2F0ZWQ6PGJyPjxicj48L2JvZHk+PC9odG1sPg==

----_com.samsung.android.email_62562235527170--

