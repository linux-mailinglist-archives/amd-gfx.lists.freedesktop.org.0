Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B9FE2DD49D
	for <lists+amd-gfx@lfdr.de>; Thu, 17 Dec 2020 16:53:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 766FF6E428;
	Thu, 17 Dec 2020 15:53:33 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DE616E422
 for <amd-gfx@lists.freedesktop.org>; Thu, 17 Dec 2020 15:53:32 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1kpvaq-0000Lm-TP; Thu, 17 Dec 2020 16:53:28 +0100
Message-ID: <eff3b1964fb0e36d1ae08c97de61d048aa742bb6.camel@pengutronix.de>
Subject: Re: [PATCH 1/1] drm/scheduler: Job timeout handler returns status (v2)
From: Lucas Stach <l.stach@pengutronix.de>
To: Luben Tuikov <luben.tuikov@amd.com>, dri-devel@lists.freedesktop.org, 
 amd-gfx@lists.freedesktop.org
Date: Thu, 17 Dec 2020 16:53:25 +0100
In-Reply-To: <e39db34c-7a45-6e2d-a0a3-09d70f380d65@amd.com>
References: <20201210021438.9190-1-luben.tuikov@amd.com>
 <20201210021438.9190-2-luben.tuikov@amd.com>
 <39a74cea2b6f3bfcc7b86de7a7a1dbcc93e21a7f.camel@pengutronix.de>
 <e39db34c-7a45-6e2d-a0a3-09d70f380d65@amd.com>
User-Agent: Evolution 3.38.2 (3.38.2-1.fc33) 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: amd-gfx@lists.freedesktop.org
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
Cc: Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>,
 kernel test robot <lkp@intel.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Rob Herring <robh@kernel.org>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Steven Price <steven.price@arm.com>, Eric Anholt <eric@anholt.net>,
 Christian Gmeiner <christian.gmeiner@gmail.com>, Qiang Yu <yuq825@gmail.com>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Alexander Deucher <Alexander.Deucher@amd.com>,
 Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

SGkgTHViZW4sCgpBbSBGcmVpdGFnLCBkZW0gMTEuMTIuMjAyMCB1bSAxNTozNiAtMDUwMCBzY2hy
aWViIEx1YmVuIFR1aWtvdjoKPiBPbiAyMDIwLTEyLTEwIDQ6MzEgYS5tLiwgTHVjYXMgU3RhY2gg
d3JvdGU6Cj4gPiBIaSBMdWJlbiwKPiA+IAo+ID4gQW0gTWl0dHdvY2gsIGRlbiAwOS4xMi4yMDIw
LCAyMToxNCAtMDUwMCBzY2hyaWViIEx1YmVuIFR1aWtvdjoKPiA+ID4gVGhpcyBwYXRjaCBkb2Vz
IG5vdCBjaGFuZ2UgY3VycmVudCBiZWhhdmlvdXIuCj4gPiA+IAo+ID4gPiBUaGUgZHJpdmVyJ3Mg
am9iIHRpbWVvdXQgaGFuZGxlciBub3cgcmV0dXJucwo+ID4gPiBzdGF0dXMgaW5kaWNhdGluZyBi
YWNrIHRvIHRoZSBEUk0gbGF5ZXIgd2hldGhlcgo+ID4gPiB0aGUgdGFzayAoam9iKSB3YXMgc3Vj
Y2Vzc2Z1bGx5IGFib3J0ZWQgb3Igd2hldGhlcgo+ID4gPiBtb3JlIHRpbWUgc2hvdWxkIGJlIGdp
dmVuIHRvIHRoZSB0YXNrIHRvIGNvbXBsZXRlLgo+ID4gPiAKPiA+ID4gRGVmYXVsdCBiZWhhdmlv
dXIgYXMgb2YgdGhpcyBwYXRjaCwgaXMgcHJlc2VydmVkLAo+ID4gPiBleGNlcHQgaW4gb2J2aW91
cy1ieS1jb21tZW50IGNhc2UgaW4gdGhlIFBhbmZyb3N0Cj4gPiA+IGRyaXZlciwgYXMgZG9jdW1l
bnRlZCBiZWxvdy4KPiA+ID4gCj4gPiA+IEFsbCBkcml2ZXJzIHdoaWNoIG1ha2UgdXNlIG9mIHRo
ZQo+ID4gPiBkcm1fc2NoZWRfYmFja2VuZF9vcHMnIC50aW1lZG91dF9qb2IoKSBjYWxsYmFjawo+
ID4gPiBoYXZlIGJlZW4gYWNjb3JkaW5nbHkgcmVuYW1lZCBhbmQgcmV0dXJuIHRoZQo+ID4gPiB3
b3VsZCd2ZS1iZWVuIGRlZmF1bHQgdmFsdWUgb2YKPiA+ID4gRFJNX1RBU0tfU1RBVFVTX0FMSVZF
IHRvIHJlc3RhcnQgdGhlIHRhc2sncwo+ID4gPiB0aW1lb3V0IHRpbWVyLS10aGlzIGlzIHRoZSBv
bGQgYmVoYXZpb3VyLCBhbmQKPiA+ID4gaXMgcHJlc2VydmVkIGJ5IHRoaXMgcGF0Y2guCj4gPiA+
IAo+ID4gPiBJbiB0aGUgY2FzZSBvZiB0aGUgUGFuZnJvc3QgZHJpdmVyLCBpdHMgdGltZWRvdXQK
PiA+ID4gY2FsbGJhY2sgY29ycmVjdGx5IGZpcnN0IGNoZWNrcyBpZiB0aGUgam9iIGhhZAo+ID4g
PiBjb21wbGV0ZWQgaW4gZHVlIHRpbWUgYW5kIGlmIHNvLCBpdCBub3cgcmV0dXJucwo+ID4gPiBE
Uk1fVEFTS19TVEFUVVNfQ09NUExFVEUgdG8gbm90aWZ5IHRoZSBEUk0gbGF5ZXIKPiA+ID4gdGhh
dCB0aGUgdGFzayBjYW4gYmUgbW92ZWQgdG8gdGhlIGRvbmUgbGlzdCwgdG8gYmUKPiA+ID4gZnJl
ZWQgbGF0ZXIuIEluIHRoZSBvdGhlciB0d28gc3Vic2VxdWVudCBjaGVja3MsCj4gPiA+IHRoZSB2
YWx1ZSBvZiBEUk1fVEFTS19TVEFUVVNfQUxJVkUgaXMgcmV0dXJuZWQsIGFzCj4gPiA+IHBlciB0
aGUgZGVmYXVsdCBiZWhhdmlvdXIuCj4gPiA+IAo+ID4gPiBBIG1vcmUgaW52b2x2ZWQgZHJpdmVy
J3Mgc29sdXRpb25zIGNhbiBiZSBoYWQKPiA+ID4gaW4gc3ViZXF1ZW50IHBhdGNoZXMuCj4gPiA+
IAo+ID4gPiB2MjogVXNlIGVudW0gYXMgdGhlIHN0YXR1cyBvZiBhIGRyaXZlcidzIGpvYgo+ID4g
PiDCoMKgwqDCoHRpbWVvdXQgY2FsbGJhY2sgbWV0aG9kLgo+ID4gPiAKPiA+ID4gQ2M6IEFsZXhh
bmRlciBEZXVjaGVyIDxBbGV4YW5kZXIuRGV1Y2hlckBhbWQuY29tPgo+ID4gPiBDYzogQW5kcmV5
IEdyb2R6b3Zza3kgPEFuZHJleS5Hcm9kem92c2t5QGFtZC5jb20+Cj4gPiA+IENjOiBDaHJpc3Rp
YW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cj4gPiA+IENjOiBEYW5pZWwgVmV0
dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPgo+ID4gPiBDYzogTHVjYXMgU3RhY2ggPGwuc3Rh
Y2hAcGVuZ3V0cm9uaXguZGU+Cj4gPiA+IENjOiBSdXNzZWxsIEtpbmcgPGxpbnV4K2V0bmF2aXZA
YXJtbGludXgub3JnLnVrPgo+ID4gPiBDYzogQ2hyaXN0aWFuIEdtZWluZXIgPGNocmlzdGlhbi5n
bWVpbmVyQGdtYWlsLmNvbT4KPiA+ID4gQ2M6IFFpYW5nIFl1IDx5dXE4MjVAZ21haWwuY29tPgo+
ID4gPiBDYzogUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4KPiA+ID4gQ2M6IFRvbWV1IFZp
em9zbyA8dG9tZXUudml6b3NvQGNvbGxhYm9yYS5jb20+Cj4gPiA+IENjOiBTdGV2ZW4gUHJpY2Ug
PHN0ZXZlbi5wcmljZUBhcm0uY29tPgo+ID4gPiBDYzogQWx5c3NhIFJvc2VuendlaWcgPGFseXNz
YS5yb3Nlbnp3ZWlnQGNvbGxhYm9yYS5jb20+Cj4gPiA+IENjOiBFcmljIEFuaG9sdCA8ZXJpY0Bh
bmhvbHQubmV0Pgo+ID4gPiBSZXBvcnRlZC1ieToga2VybmVsIHRlc3Qgcm9ib3QgPGxrcEBpbnRl
bC5jb20+Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IEx1YmVuIFR1aWtvdiA8bHViZW4udHVpa292QGFt
ZC5jb20+Cj4gPiA+IC0tLQo+ID4gPiDCoGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV9qb2IuYyB8ICA2ICsrKy0tCj4gPiA+IMKgZHJpdmVycy9ncHUvZHJtL2V0bmF2aXYvZXRuYXZp
dl9zY2hlZC5jIHwgMTAgKysrKysrKy0KPiA+ID4gwqBkcml2ZXJzL2dwdS9kcm0vbGltYS9saW1h
X3NjaGVkLmMgICAgICAgfCAgNCArKystCj4gPiA+IMKgZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0
L3BhbmZyb3N0X2pvYi5jIHwgIDkgKysrKy0tLQo+ID4gPiDCoGRyaXZlcnMvZ3B1L2RybS9zY2hl
ZHVsZXIvc2NoZWRfbWFpbi5jICB8ICA0ICstLS0KPiA+ID4gwqBkcml2ZXJzL2dwdS9kcm0vdjNk
L3YzZF9zY2hlZC5jICAgICAgICAgfCAzMiArKysrKysrKysrKysrLS0tLS0tLS0tLS0tCj4gPiA+
IMKgaW5jbHVkZS9kcm0vZ3B1X3NjaGVkdWxlci5oICAgICAgICAgICAgIHwgMjAgKysrKysrKysr
KysrKy0tLQo+ID4gPiDCoDcgZmlsZXMgY2hhbmdlZCwgNTcgaW5zZXJ0aW9ucygrKSwgMjggZGVs
ZXRpb25zKC0pCj4gPiA+IAo+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X2pvYi5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2pv
Yi5jCj4gPiA+IGluZGV4IGZmNDgxMDFiYWI1NS4uYTExMTMyNmNiZGRlIDEwMDY0NAo+ID4gPiAt
LS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfam9iLmMKPiA+ID4gKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2pvYi5jCj4gPiA+IEBAIC0yOCw3ICsy
OCw3IEBACj4gPiA+IMKgI2luY2x1ZGUgImFtZGdwdS5oIgo+ID4gPiDCoCNpbmNsdWRlICJhbWRn
cHVfdHJhY2UuaCIKPiA+ID4gwqAKPiA+ID4gCj4gPiA+IAo+ID4gPiAKPiA+ID4gLXN0YXRpYyB2
b2lkIGFtZGdwdV9qb2JfdGltZWRvdXQoc3RydWN0IGRybV9zY2hlZF9qb2IgKnNfam9iKQo+ID4g
PiArc3RhdGljIGVudW0gZHJtX3Rhc2tfc3RhdHVzIGFtZGdwdV9qb2JfdGltZWRvdXQoc3RydWN0
IGRybV9zY2hlZF9qb2IgKnNfam9iKQo+ID4gPiDCoHsKPiA+ID4gwqAJc3RydWN0IGFtZGdwdV9y
aW5nICpyaW5nID0gdG9fYW1kZ3B1X3Jpbmcoc19qb2ItPnNjaGVkKTsKPiA+ID4gwqAJc3RydWN0
IGFtZGdwdV9qb2IgKmpvYiA9IHRvX2FtZGdwdV9qb2Ioc19qb2IpOwo+ID4gPiBAQCAtNDEsNyAr
NDEsNyBAQCBzdGF0aWMgdm9pZCBhbWRncHVfam9iX3RpbWVkb3V0KHN0cnVjdCBkcm1fc2NoZWRf
am9iICpzX2pvYikKPiA+ID4gwqAJICAgIGFtZGdwdV9yaW5nX3NvZnRfcmVjb3ZlcnkocmluZywg
am9iLT52bWlkLCBzX2pvYi0+c19mZW5jZS0+cGFyZW50KSkgewo+ID4gPiDCoAkJRFJNX0VSUk9S
KCJyaW5nICVzIHRpbWVvdXQsIGJ1dCBzb2Z0IHJlY292ZXJlZFxuIiwKPiA+ID4gwqAJCQkgIHNf
am9iLT5zY2hlZC0+bmFtZSk7Cj4gPiA+IC0JCXJldHVybjsKPiA+ID4gKwkJcmV0dXJuIERSTV9U
QVNLX1NUQVRVU19BTElWRTsKPiA+ID4gwqAJfQo+ID4gPiDCoAo+ID4gPiAKPiA+ID4gCj4gPiA+
IAo+ID4gPiDCoAlhbWRncHVfdm1fZ2V0X3Rhc2tfaW5mbyhyaW5nLT5hZGV2LCBqb2ItPnBhc2lk
LCAmdGkpOwo+ID4gPiBAQCAtNTMsMTAgKzUzLDEyIEBAIHN0YXRpYyB2b2lkIGFtZGdwdV9qb2Jf
dGltZWRvdXQoc3RydWN0IGRybV9zY2hlZF9qb2IgKnNfam9iKQo+ID4gPiDCoAo+ID4gPiAKPiA+
ID4gCj4gPiA+IAo+ID4gPiDCoAlpZiAoYW1kZ3B1X2RldmljZV9zaG91bGRfcmVjb3Zlcl9ncHUo
cmluZy0+YWRldikpIHsKPiA+ID4gwqAJCWFtZGdwdV9kZXZpY2VfZ3B1X3JlY292ZXIocmluZy0+
YWRldiwgam9iKTsKPiA+ID4gKwkJcmV0dXJuIERSTV9UQVNLX1NUQVRVU19BTElWRTsKPiA+ID4g
wqAJfSBlbHNlIHsKPiA+ID4gwqAJCWRybV9zY2hlZF9zdXNwZW5kX3RpbWVvdXQoJnJpbmctPnNj
aGVkKTsKPiA+ID4gwqAJCWlmIChhbWRncHVfc3Jpb3ZfdmYoYWRldikpCj4gPiA+IMKgCQkJYWRl
di0+dmlydC50ZHJfZGVidWcgPSB0cnVlOwo+ID4gPiArCQlyZXR1cm4gRFJNX1RBU0tfU1RBVFVT
X0FMSVZFOwo+ID4gPiDCoAl9Cj4gPiA+IMKgfQo+ID4gPiDCoAo+ID4gPiAKPiA+ID4gCj4gPiA+
IAo+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2V0bmF2aXYvZXRuYXZpdl9zY2hl
ZC5jIGIvZHJpdmVycy9ncHUvZHJtL2V0bmF2aXYvZXRuYXZpdl9zY2hlZC5jCj4gPiA+IGluZGV4
IGNkNDZjODgyMjY5Yy4uYzQ5NTE2OTQyMzI4IDEwMDY0NAo+ID4gPiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0vZXRuYXZpdi9ldG5hdml2X3NjaGVkLmMKPiA+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L2V0bmF2aXYvZXRuYXZpdl9zY2hlZC5jCj4gPiA+IEBAIC04Miw3ICs4Miw4IEBAIHN0YXRpYyBz
dHJ1Y3QgZG1hX2ZlbmNlICpldG5hdml2X3NjaGVkX3J1bl9qb2Ioc3RydWN0IGRybV9zY2hlZF9q
b2IgKnNjaGVkX2pvYikKPiA+ID4gwqAJcmV0dXJuIGZlbmNlOwo+ID4gPiDCoH0KPiA+ID4gwqAK
PiA+ID4gCj4gPiA+IAo+ID4gPiAKPiA+ID4gLXN0YXRpYyB2b2lkIGV0bmF2aXZfc2NoZWRfdGlt
ZWRvdXRfam9iKHN0cnVjdCBkcm1fc2NoZWRfam9iICpzY2hlZF9qb2IpCj4gPiA+ICtzdGF0aWMg
ZW51bSBkcm1fdGFza19zdGF0dXMgZXRuYXZpdl9zY2hlZF90aW1lZG91dF9qb2Ioc3RydWN0IGRy
bV9zY2hlZF9qb2IKPiA+ID4gKwkJCQkJCSAgICAgICAqc2NoZWRfam9iKQo+ID4gPiDCoHsKPiA+
ID4gwqAJc3RydWN0IGV0bmF2aXZfZ2VtX3N1Ym1pdCAqc3VibWl0ID0gdG9fZXRuYXZpdl9zdWJt
aXQoc2NoZWRfam9iKTsKPiA+ID4gwqAJc3RydWN0IGV0bmF2aXZfZ3B1ICpncHUgPSBzdWJtaXQt
PmdwdTsKPiA+ID4gQEAgLTEyMCw5ICsxMjEsMTYgQEAgc3RhdGljIHZvaWQgZXRuYXZpdl9zY2hl
ZF90aW1lZG91dF9qb2Ioc3RydWN0IGRybV9zY2hlZF9qb2IgKnNjaGVkX2pvYikKPiA+ID4gwqAK
PiA+ID4gwqAJZHJtX3NjaGVkX3Jlc3VibWl0X2pvYnMoJmdwdS0+c2NoZWQpOwo+ID4gPiDCoAo+
ID4gPiArCS8qIFRlbGwgdGhlIERSTSBzY2hlZHVsZXIgdGhhdCB0aGlzIHRhc2sgbmVlZHMKPiA+
ID4gKwkgKiBtb3JlIHRpbWUuCj4gPiA+ICsJICovCj4gPiAKPiA+IFRoaXMgY29tbWVudCBkb2Vz
bid0IG1hdGNoIHRoZSBrZXJuZWwgY29kaW5nIHN0eWxlLCBidXQgaXQncyBhbHNvIG1vb3QKPiA+
IGFzIHRoZSB3aG9sZSBhZGRlZCBjb2RlIGJsb2NrIGlzbid0IG5lZWRlZC4gVGhlIGNvZGUganVz
dCBiZWxvdyBpcwo+ID4gaWRlbnRpY2FsLCBzbyBsZXR0aW5nIGV4ZWN1dGlvbiBjb250aW51ZSBo
ZXJlIGluc3RlYWQgb2YgcmV0dXJuaW5nCj4gPiB3b3VsZCBiZSB0aGUgcmlnaHQgdGhpbmcgdG8g
ZG8sIGJ1dCBtYXliZSB5b3UgbWVhbiB0byByZXR1cm4KPiA+IERSTV9UQVNLX1NUQVRVU19DT01Q
TEVURT8gSXQncyBhIGJpdCBjb25mdXNpbmcgdGhhdCBhYm9ydGVkIGFuZCBqb2IKPiA+IHN1Y2Nl
c3NmdWxseSBmaW5pc2hlZCBzaG91bGQgYmUgc2lnbmFsZWQgd2l0aCB0aGUgc2FtZSByZXR1cm4g
Y29kZS4KPiAKPiBUaGUga2VybmVsIGNvZGluZyBzdHlsZSB0YWtlcyB0aGUgbmV0LyBzdHlsZSBv
ZiBjb21tZW50cywgYXMgd2VsbAo+IGFzIHRoZSBub24tbmV0LyBzdHlsZSBvZiBjb21tZW50cy0t
d2l0aCBhIGxlYWRpbmcgLyogb24gYW4gZW1wdHkgbGluZS4KPiBJJ20gdXNpbmcgdGhlIG5ldC8g
c3R5bGUuIGNoZWNrcGF0Y2gucGwgc2FpZCBldmVyeXRoaW5nIGlzIG9rYXksCj4gd2hpY2ggSSd2
ZSBpbnRlZ3JhdGVkIGluIG15IGdpdC1ob29rcyB0byBjaGVjayBldmVyeSBwYXRjaCBhbmQKPiBl
dmVyeSBjb21taXQuCgpBcyBhIGdlbmVyYWwgcnVsZSwgdXNlIHRoZSBjb2Rpbmcgc3R5bGUgb2Yg
dGhlIHN1cnJvdW5kaW5nIGNvZGUuIEknbQpjZXJ0YWlubHkgdW53aWxsaW5nIHRvIGFjY2VwdCBu
ZXQgc3R5bGUgY29tbWVudHMgaW4gZXRuYXZpdi4KCj4gSSdtIG5vdCBmYW1pbGlhciB3aXRoIHRo
ZSBldG5hdml2J3MgaW50ZXJuYWxzIGFuZCB3aGF0IHlvdSBzZWUgaGVyZQo+IGlzIG15IGJlc3Qg
Z3Vlc3N0aW1hdGUuCj4gCj4gSSB1bmRlcnN0YW5kIHlvdXIgY29uZnVzaW9uIHRoYXQgYW4gYWJv
cnRlZCBqb2IgYW5kCj4gc3VjY2Vzc2Z1bGx5IGNvbXBsZXRlZCBqb2IgQk9USCByZXR1cm4gRFJN
X1RBU0tfU1RBVFVTX0NPTVBMRVRFLAo+IHJpZ2h0PyBUaGF0J3MgaW5zYW5pdHksIHJpZ2h0PyBQ
ZXJoYXBzIHdlIHNob3VsZCByZXR1cm4gQUJPUlRFRAo+IGZvciBvbmUgYW5kIEZJTklTSEVEIGZv
ciBhbm90aGVyLCBubz8KPiAKPiBTbywgdGhpcyBpcyBpbnRlbnRpb25hbC4gRFJNX1RBU0tfU1RB
VFVTX0NPTVBMRVRFIGRvZXNuJ3QKPiBpbmRpY2F0ZSB0aGUgZXhlY3V0aW9uIHN0YXR1cyBvZiB0
aGUgdGFzay0tdGhpcyBpcyBmb3IKPiB0aGUgYXBwbGljYXRpb24gY2xpZW50IHRvIGRldGVybWlu
ZSwgZS5nLiBNZXNhLiBGb3IgRFJNIGFuZCB0aGUgZHJpdmVyLAo+IGFzIGEgdHJhbnNwb3J0LCB0
aGUgZHJpdmVyIHdhbnRzIHRvIHRlbGwgdGhlIERSTSBsYXllcgo+IHRoYXQgdGhlIERSTSBsYXll
ciB3aWxsICpub3QgaGVhciBmcm9tIHRoaXMgdGFzayosIHRoYXQgaXMKPiB0aGlzIHRhc2sgaXMg
b3V0IG9mIHRoZSBoYXJkd2FyZSBhbmQgYXMgc3VjaCByZWxldmFudCBtZW1vcnkgY2FuIGJlCj4g
cmVsZWFzZWQuCj4gCj4gVGFzayB3YXMgYWJvcnRlZCBzdWNjZXNzZnVsbHk6IG91dCBvZiB0aGUg
aGFyZHdhcmUsIGZyZWUgcmVsZXZhbnQgbWVtb3JpZXMuCj4gVGFzayBoYXMgY29tcGxldGVkIHN1
Y2Nlc3NmdWxseTogb3V0IG9mIHRoZSBoYXJkd2FyZSwgZnJlZSByZWxldmFudCBtZW1vcmllcy4K
PiAKPiBBcyBhIHRyYW5zcG9ydCwgdGhlIGRyaXZlciBhbmQgRFJNIGRvbid0IHdhbnQgdG8ga25v
dyB0aGUgaW50ZXJuYWxzCj4gb2YgdGhlIHRhc2stLW9ubHkgaWYgaXQgaXMsIG9yIG5vdCwgaW4g
dGhlIGhhcmR3YXJlLCBzbyB0aGF0IGtyZWZzCj4gY2FuIGJlIGtlcHQgb3IgZGVjcmVtZW50ZWQs
IGFuZCByZWxldmFudCBtZW1vcmllcyBmcmVlZC4KPiAKPiBCeSByZXR1cm5pbmcgIkFMSVZFIiwg
dGhlIGRyaXZlciBzYXlzIHRvIERSTSwgdGhhdCB0aGUgdGFzawo+IGlzIG5vdyBpbiB0aGUgaGFy
ZHdhcmUuIE1heWJlIGl0IHdhcyBhYm9ydGVkIGFuZCByZWlzc3VlZCwKPiBtYXliZSBpdCBpcyBz
dGlsbCBleGVjdXRpbmctLXdlIGRvbid0IGNhcmUuCj4gCj4gVGhlIERSTSBsYXllciBjYW4gZGVj
aWRlIHdoYXQgdG8gZG8gbmV4dCwgYnV0IHRoZSBkcml2ZXIKPiBkb2Vzbid0IGNvbnRyb2wgdGhp
cy4gRm9yIGluc3RhbmNlLCBhIHNlbnNpYmxlIHRoaW5nIHRvIGRvCj4gd291bGQgYmUgdG8gZXh0
ZW5kIHRoZSB0aW1lb3V0IHRpbWVyIGZvciB0aGlzIHRhc2ssIGJ1dCB0aGlzCj4gc29tZXRoaW5n
IHdoaWNoIERSTSBkb2VzLCBhbmQgdGhlIGRyaXZlciBzaG91bGRuJ3QgbmVjZXNzYXJpbHkKPiBj
b250cm9sIHRoaXMtLWkuZS4gYSBzaW1wbGUgY29kZSBpcyByZXR1cm5lZCwgYW5kIGEgY2xlYXIK
PiBzZXBhcmF0aW9uIGJldHdlZW4gdGhlIGxheWVycyBpcyBzZXQuCj4gCj4gIkFMSVZFIiBpcyBl
c3NlbnRpYWxseSB3aGF0IHdlIGRpZCBiZWZvcmUgdGhpcyBwYXRjaCwKPiBzbyBoZXJlIEkgcmV0
dXJuIHRoaXMgdG8gbWltaWMgcGFzdCBiZWhhdmlvdXIuCj4gU2hvdWxkIENPTVBMRVRFIGJlIHJl
dHVybmVkPyBJcyB0aGUgdGFzayBvdXQgb2YKPiB0aGUgaGFyZHdhcmUsIG5ldmVyIHRvIGJlIGhl
YXJkIG9mIGFnYWluPwoKSWYgeW91IGp1c3Qgd2FudCBhIGluZGljYXRpb24gb2Ygd2VhdGhlciB0
aGUgam9iIGlzIHN0aWxsIHBlbmRpbmcgaW4KdGhlIGhhcmR3YXJlIG9yIGhhcyBiZWVuIGNvbXBs
ZXRlZC90aHJvd24gb3V0IEknbSBub3Qgc3VyZSB3aHkgeW91CndvdWxkIHdhbnQgdG8gZnVubmVs
IHRoaXMgaW5mb3JtYXRpb24gdGhyb3VnaCB0aGUgcmV0dXJuIHZhbHVlIG9mIHRoZQp0aW1lb3V0
IGhhbmRsZXIuIFRoZXJlIGlzIGFscmVhZHkgYSBjYW5vbmljYWwgcGxhY2UgZm9yIHRoaXMKaW5m
b3JtYXRpb246IHRoZSBqb2JzIGhhcmR3YXJlIGZlbmNlLiBJZiB0aGUgZmVuY2UgaXMgc2lnbmFs
ZWQgdGhlIGpvYgpoYXMgbGVmdCB0aGUgaGFyZHdhcmUgYW5kIHlvdSBjYW4gZnJlZSBhbGwgYXNz
b2NpYXRlZCByZXNvdXJjZXMuIElmIHRoZQpmZW5jZSBpc24ndCBzaWduYWxlZCB0aGUgam9iIGlz
IHN0aWxsIHBlbmRpbmcgYW5kIHlvdSBuZWVkIHRvIGtlZXAgdGhlCnJlc291cmNlcyBhcm91bmQu
CgpSZWdhcmRzLApMdWNhcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
Cg==
