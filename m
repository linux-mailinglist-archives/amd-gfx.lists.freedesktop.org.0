Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 17D7C70C581
	for <lists+amd-gfx@lfdr.de>; Mon, 22 May 2023 20:46:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A86A110E213;
	Mon, 22 May 2023 18:46:42 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA7CF10E209;
 Mon, 22 May 2023 18:46:39 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 889D3200D7;
 Mon, 22 May 2023 18:46:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1684781196; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Ud/IBVxh6o7H9VnwlwS0BVlimbK4GO3NW8LeZ8tGZV0=;
 b=rQkiPJyfljbUmBf3sPAy6RzgS0qEKqgfq5IekpFzLZk0PSK2Ed5rigWwTMyaLzDE1DhqdV
 8/D7xgF29fMvB2WKY2j+qCyQdvoVbWrrSpkW829zQNLRGD4J6sGVUqOJkFLRrMgUm+Pa+U
 BfCDHf5LZqwkPvd9w3dVNjeT94ic0XY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1684781196;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Ud/IBVxh6o7H9VnwlwS0BVlimbK4GO3NW8LeZ8tGZV0=;
 b=61aGs6mkXRGksMAylaEpP8JTpl1zCVmd6gxA5LjD/YkGU6sBfCGh7poPkTk46jmBgCv+On
 sW6sRyxnex1p7FBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 36D0313336;
 Mon, 22 May 2023 18:46:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id nylUDIy4a2R9KAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 22 May 2023 18:46:36 +0000
Message-ID: <064b6506-27f1-4b4d-60b2-d30d470cc0fa@suse.de>
Date: Mon, 22 May 2023 20:46:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [Freedreno] [PATCH v3 11/12] drm/fbdev-generic: Implement
 dedicated fbdev I/O helpers
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20230522122140.30131-1-tzimmermann@suse.de>
 <20230522122140.30131-12-tzimmermann@suse.de>
 <CAA8EJpp4Q0P7JSK=1igsQ4gbLjbW2X670CKQrZSm_epzqusYug@mail.gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <CAA8EJpp4Q0P7JSK=1igsQ4gbLjbW2X670CKQrZSm_epzqusYug@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------u14AFYyuSD0v0kQkWCDtOTS1"
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
Cc: freedreno@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, airlied@gmail.com,
 intel-gfx@lists.freedesktop.org, maarten.lankhorst@linux.intel.com,
 javierm@redhat.com, mripard@kernel.org, dri-devel@lists.freedesktop.org,
 daniel@ffwll.ch, linux-arm-msm@vger.kernel.org, linux-tegra@vger.kernel.org,
 sam@ravnborg.org, linux-arm-kernel@lists.infradead.org
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------u14AFYyuSD0v0kQkWCDtOTS1
Content-Type: multipart/mixed; boundary="------------FfZtj8l0tZppTLr8p1YXOL7D";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: daniel@ffwll.ch, airlied@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, javierm@redhat.com, sam@ravnborg.org,
 linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Message-ID: <064b6506-27f1-4b4d-60b2-d30d470cc0fa@suse.de>
Subject: Re: [Freedreno] [PATCH v3 11/12] drm/fbdev-generic: Implement
 dedicated fbdev I/O helpers
References: <20230522122140.30131-1-tzimmermann@suse.de>
 <20230522122140.30131-12-tzimmermann@suse.de>
 <CAA8EJpp4Q0P7JSK=1igsQ4gbLjbW2X670CKQrZSm_epzqusYug@mail.gmail.com>
In-Reply-To: <CAA8EJpp4Q0P7JSK=1igsQ4gbLjbW2X670CKQrZSm_epzqusYug@mail.gmail.com>

--------------FfZtj8l0tZppTLr8p1YXOL7D
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjIuMDUuMjMgdW0gMTU6MjAgc2NocmllYiBEbWl0cnkgQmFyeXNoa292Og0K
PiBPbiBNb24sIDIyIE1heSAyMDIzIGF0IDE1OjIyLCBUaG9tYXMgWmltbWVybWFubiA8dHpp
bW1lcm1hbm5Ac3VzZS5kZT4gd3JvdGU6DQo+Pg0KPj4gSW1wbGVtZW50IGRlZGljYXRlZCBm
YmRldiBoZWxwZXJzIGZvciBmcmFtZWJ1ZmZlciBJL08gaW5zdGVhZA0KPj4gb2YgdXNpbmcg
RFJNJ3MgaGVscGVycy4gRmJkZXYtZ2VuZXJpYyB3YXMgdGhlIG9ubHkgY2FsbGVyIG9mIHRo
ZQ0KPj4gRFJNIGhlbHBlcnMsIHNvIHJlbW92ZSB0aGVtIGZyb20gdGhlIGhlbHBlciBtb2R1
bGUuDQo+Pg0KPj4gdjI6DQo+PiAgICAgICAgICAqIHVzZSBGQl9TWVNfSEVMUEVSU19ERUZF
UlJFRCBvcHRpb24NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgWmltbWVybWFubiA8
dHppbW1lcm1hbm5Ac3VzZS5kZT4NCj4+IC0tLQ0KPj4gICBkcml2ZXJzL2dwdS9kcm0vS2Nv
bmZpZyAgICAgICAgICAgICB8ICAgNiArLQ0KPj4gICBkcml2ZXJzL2dwdS9kcm0vZHJtX2Zi
X2hlbHBlci5jICAgICB8IDEwNyAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+PiAg
IGRyaXZlcnMvZ3B1L2RybS9kcm1fZmJkZXZfZ2VuZXJpYy5jIHwgIDQ3ICsrKysrKysrKyst
LQ0KPj4gICBpbmNsdWRlL2RybS9kcm1fZmJfaGVscGVyLmggICAgICAgICB8ICA0MSAtLS0t
LS0tLS0tLQ0KPj4gICA0IGZpbGVzIGNoYW5nZWQsIDQzIGluc2VydGlvbnMoKyksIDE1OCBk
ZWxldGlvbnMoLSkNCj4gDQo+IExvb2tpbmcgYXQgdGhpcyBwYXRjaCBtYWtlcyBtZSB3b25k
ZXIgaWYgd2Ugc2hvdWxkIGhhdmUgaW1wbGVtZW50ZWQNCj4gZmJfZGlydHkgZm9yIHRoZSBN
U00gZHJpdmVyLiBXZSBoYXZlIGRybV9mcmFtZWJ1ZmZlcl9mdW5jczo6ZGlydHkoKQ0KPiBp
bXBsZW1lbnRlZCAoYnkgd3JhcHBpbmcgdGhlIGRybV9hdG9taWNfaGVscGVyX2RpcnR5ZmIo
KSkuDQoNCkkgdGhpbmsgc28uIFlvdSdkIG5lZWQgc29tZXRoaW5nIHNpbWlsYXIgdG8gdGhl
IGdlbmVyaWMgZmJkZXYgZW11bGF0aW9uLiANCkJ1dCBpdCdzIGZvciBhIHNlcGFyYXRlIHBh
dGNoc2V0LiBBcHBhcmVudGx5IG5vIG9uZSBoYXMgY29tcGxhaW5lZCBzbyBmYXIuDQoNCkJl
c3QgcmVnYXJkcw0KVGhvbWFzDQoNCj4gDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9LY29uZmlnIGIvZHJpdmVycy9ncHUvZHJtL0tjb25maWcNCj4+IGluZGV4IDc3
ZmIxMGRkZDhhMi4uOTJhNzgyODI3YjdiIDEwMDY0NA0KPj4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL0tjb25maWcNCj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9LY29uZmlnDQo+PiBAQCAt
OTUsNiArOTUsNyBAQCBjb25maWcgRFJNX0tVTklUX1RFU1QNCj4+ICAgY29uZmlnIERSTV9L
TVNfSEVMUEVSDQo+PiAgICAgICAgICB0cmlzdGF0ZQ0KPj4gICAgICAgICAgZGVwZW5kcyBv
biBEUk0NCj4+ICsgICAgICAgc2VsZWN0IEZCX1NZU19IRUxQRVJTX0RFRkVSUkVEIGlmIERS
TV9GQkRFVl9FTVVMQVRJT04NCj4+ICAgICAgICAgIGhlbHANCj4+ICAgICAgICAgICAgQ1JU
QyBoZWxwZXJzIGZvciBLTVMgZHJpdmVycy4NCj4+DQo+PiBAQCAtMTM1LDExICsxMzYsNiBA
QCBjb25maWcgRFJNX0ZCREVWX0VNVUxBVElPTg0KPj4gICAgICAgICAgc2VsZWN0IEZCX0NG
Ql9GSUxMUkVDVA0KPj4gICAgICAgICAgc2VsZWN0IEZCX0NGQl9DT1BZQVJFQQ0KPj4gICAg
ICAgICAgc2VsZWN0IEZCX0NGQl9JTUFHRUJMSVQNCj4+IC0gICAgICAgc2VsZWN0IEZCX0RF
RkVSUkVEX0lPDQo+PiAtICAgICAgIHNlbGVjdCBGQl9TWVNfRk9QUw0KPj4gLSAgICAgICBz
ZWxlY3QgRkJfU1lTX0ZJTExSRUNUDQo+PiAtICAgICAgIHNlbGVjdCBGQl9TWVNfQ09QWUFS
RUENCj4+IC0gICAgICAgc2VsZWN0IEZCX1NZU19JTUFHRUJMSVQNCj4+ICAgICAgICAgIHNl
bGVjdCBGUkFNRUJVRkZFUl9DT05TT0xFIGlmICFFWFBFUlQNCj4+ICAgICAgICAgIHNlbGVj
dCBGUkFNRUJVRkZFUl9DT05TT0xFX0RFVEVDVF9QUklNQVJZIGlmIEZSQU1FQlVGRkVSX0NP
TlNPTEUNCj4+ICAgICAgICAgIGRlZmF1bHQgeQ0KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9kcm1fZmJfaGVscGVyLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2ZiX2hlbHBl
ci5jDQo+PiBpbmRleCA4NzI0ZTA4YzUxOGIuLmJhMGE4MDhmMTRlZSAxMDA2NDQNCj4+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZmJfaGVscGVyLmMNCj4+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS9kcm1fZmJfaGVscGVyLmMNCj4+IEBAIC03MjksMTEzICs3MjksNiBAQCB2b2lk
IGRybV9mYl9oZWxwZXJfZGVmZXJyZWRfaW8oc3RydWN0IGZiX2luZm8gKmluZm8sIHN0cnVj
dCBsaXN0X2hlYWQgKnBhZ2VyZWZsaQ0KPj4gICB9DQo+PiAgIEVYUE9SVF9TWU1CT0woZHJt
X2ZiX2hlbHBlcl9kZWZlcnJlZF9pbyk7DQo+Pg0KPj4gLS8qKg0KPj4gLSAqIGRybV9mYl9o
ZWxwZXJfc3lzX3JlYWQgLSBJbXBsZW1lbnRzIHN0cnVjdCAmZmJfb3BzLmZiX3JlYWQgZm9y
IHN5c3RlbSBtZW1vcnkNCj4+IC0gKiBAaW5mbzogZmJfaW5mbyBzdHJ1Y3QgcG9pbnRlcg0K
Pj4gLSAqIEBidWY6IHVzZXJzcGFjZSBidWZmZXIgdG8gcmVhZCBmcm9tIGZyYW1lYnVmZmVy
IG1lbW9yeQ0KPj4gLSAqIEBjb3VudDogbnVtYmVyIG9mIGJ5dGVzIHRvIHJlYWQgZnJvbSBm
cmFtZWJ1ZmZlciBtZW1vcnkNCj4+IC0gKiBAcHBvczogcmVhZCBvZmZzZXQgd2l0aGluIGZy
YW1lYnVmZmVyIG1lbW9yeQ0KPj4gLSAqDQo+PiAtICogUmV0dXJuczoNCj4+IC0gKiBUaGUg
bnVtYmVyIG9mIGJ5dGVzIHJlYWQgb24gc3VjY2Vzcywgb3IgYW4gZXJyb3IgY29kZSBvdGhl
cndpc2UuDQo+PiAtICovDQo+PiAtc3NpemVfdCBkcm1fZmJfaGVscGVyX3N5c19yZWFkKHN0
cnVjdCBmYl9pbmZvICppbmZvLCBjaGFyIF9fdXNlciAqYnVmLA0KPj4gLSAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHNpemVfdCBjb3VudCwgbG9mZl90ICpwcG9zKQ0KPj4gLXsN
Cj4+IC0gICAgICAgcmV0dXJuIGZiX3N5c19yZWFkKGluZm8sIGJ1ZiwgY291bnQsIHBwb3Mp
Ow0KPj4gLX0NCj4+IC1FWFBPUlRfU1lNQk9MKGRybV9mYl9oZWxwZXJfc3lzX3JlYWQpOw0K
Pj4gLQ0KPj4gLS8qKg0KPj4gLSAqIGRybV9mYl9oZWxwZXJfc3lzX3dyaXRlIC0gSW1wbGVt
ZW50cyBzdHJ1Y3QgJmZiX29wcy5mYl93cml0ZSBmb3Igc3lzdGVtIG1lbW9yeQ0KPj4gLSAq
IEBpbmZvOiBmYl9pbmZvIHN0cnVjdCBwb2ludGVyDQo+PiAtICogQGJ1ZjogdXNlcnNwYWNl
IGJ1ZmZlciB0byB3cml0ZSB0byBmcmFtZWJ1ZmZlciBtZW1vcnkNCj4+IC0gKiBAY291bnQ6
IG51bWJlciBvZiBieXRlcyB0byB3cml0ZSB0byBmcmFtZWJ1ZmZlciBtZW1vcnkNCj4+IC0g
KiBAcHBvczogd3JpdGUgb2Zmc2V0IHdpdGhpbiBmcmFtZWJ1ZmZlciBtZW1vcnkNCj4+IC0g
Kg0KPj4gLSAqIFJldHVybnM6DQo+PiAtICogVGhlIG51bWJlciBvZiBieXRlcyB3cml0dGVu
IG9uIHN1Y2Nlc3MsIG9yIGFuIGVycm9yIGNvZGUgb3RoZXJ3aXNlLg0KPj4gLSAqLw0KPj4g
LXNzaXplX3QgZHJtX2ZiX2hlbHBlcl9zeXNfd3JpdGUoc3RydWN0IGZiX2luZm8gKmluZm8s
IGNvbnN0IGNoYXIgX191c2VyICpidWYsDQo+PiAtICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHNpemVfdCBjb3VudCwgbG9mZl90ICpwcG9zKQ0KPj4gLXsNCj4+IC0gICAgICAg
c3RydWN0IGRybV9mYl9oZWxwZXIgKmhlbHBlciA9IGluZm8tPnBhcjsNCj4+IC0gICAgICAg
bG9mZl90IHBvcyA9ICpwcG9zOw0KPj4gLSAgICAgICBzc2l6ZV90IHJldDsNCj4+IC0gICAg
ICAgc3RydWN0IGRybV9yZWN0IGRhbWFnZV9hcmVhOw0KPj4gLQ0KPj4gLSAgICAgICByZXQg
PSBmYl9zeXNfd3JpdGUoaW5mbywgYnVmLCBjb3VudCwgcHBvcyk7DQo+PiAtICAgICAgIGlm
IChyZXQgPD0gMCkNCj4+IC0gICAgICAgICAgICAgICByZXR1cm4gcmV0Ow0KPj4gLQ0KPj4g
LSAgICAgICBpZiAoaGVscGVyLT5mdW5jcy0+ZmJfZGlydHkpIHsNCj4+IC0gICAgICAgICAg
ICAgICBkcm1fZmJfaGVscGVyX21lbW9yeV9yYW5nZV90b19jbGlwKGluZm8sIHBvcywgcmV0
LCAmZGFtYWdlX2FyZWEpOw0KPj4gLSAgICAgICAgICAgICAgIGRybV9mYl9oZWxwZXJfZGFt
YWdlKGhlbHBlciwgZGFtYWdlX2FyZWEueDEsIGRhbWFnZV9hcmVhLnkxLA0KPj4gLSAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGRybV9yZWN0X3dpZHRoKCZkYW1hZ2Vf
YXJlYSksDQo+PiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZHJtX3Jl
Y3RfaGVpZ2h0KCZkYW1hZ2VfYXJlYSkpOw0KPj4gLSAgICAgICB9DQo+PiAtDQo+PiAtICAg
ICAgIHJldHVybiByZXQ7DQo+PiAtfQ0KPj4gLUVYUE9SVF9TWU1CT0woZHJtX2ZiX2hlbHBl
cl9zeXNfd3JpdGUpOw0KPj4gLQ0KPj4gLS8qKg0KPj4gLSAqIGRybV9mYl9oZWxwZXJfc3lz
X2ZpbGxyZWN0IC0gd3JhcHBlciBhcm91bmQgc3lzX2ZpbGxyZWN0DQo+PiAtICogQGluZm86
IGZiZGV2IHJlZ2lzdGVyZWQgYnkgdGhlIGhlbHBlcg0KPj4gLSAqIEByZWN0OiBpbmZvIGFi
b3V0IHJlY3RhbmdsZSB0byBmaWxsDQo+PiAtICoNCj4+IC0gKiBBIHdyYXBwZXIgYXJvdW5k
IHN5c19maWxscmVjdCBpbXBsZW1lbnRlZCBieSBmYmRldiBjb3JlDQo+PiAtICovDQo+PiAt
dm9pZCBkcm1fZmJfaGVscGVyX3N5c19maWxscmVjdChzdHJ1Y3QgZmJfaW5mbyAqaW5mbywN
Cj4+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29uc3Qgc3RydWN0IGZiX2Zp
bGxyZWN0ICpyZWN0KQ0KPj4gLXsNCj4+IC0gICAgICAgc3RydWN0IGRybV9mYl9oZWxwZXIg
KmhlbHBlciA9IGluZm8tPnBhcjsNCj4+IC0NCj4+IC0gICAgICAgc3lzX2ZpbGxyZWN0KGlu
Zm8sIHJlY3QpOw0KPj4gLQ0KPj4gLSAgICAgICBpZiAoaGVscGVyLT5mdW5jcy0+ZmJfZGly
dHkpDQo+PiAtICAgICAgICAgICAgICAgZHJtX2ZiX2hlbHBlcl9kYW1hZ2UoaGVscGVyLCBy
ZWN0LT5keCwgcmVjdC0+ZHksIHJlY3QtPndpZHRoLCByZWN0LT5oZWlnaHQpOw0KPj4gLX0N
Cj4+IC1FWFBPUlRfU1lNQk9MKGRybV9mYl9oZWxwZXJfc3lzX2ZpbGxyZWN0KTsNCj4+IC0N
Cj4+IC0vKioNCj4+IC0gKiBkcm1fZmJfaGVscGVyX3N5c19jb3B5YXJlYSAtIHdyYXBwZXIg
YXJvdW5kIHN5c19jb3B5YXJlYQ0KPj4gLSAqIEBpbmZvOiBmYmRldiByZWdpc3RlcmVkIGJ5
IHRoZSBoZWxwZXINCj4+IC0gKiBAYXJlYTogaW5mbyBhYm91dCBhcmVhIHRvIGNvcHkNCj4+
IC0gKg0KPj4gLSAqIEEgd3JhcHBlciBhcm91bmQgc3lzX2NvcHlhcmVhIGltcGxlbWVudGVk
IGJ5IGZiZGV2IGNvcmUNCj4+IC0gKi8NCj4+IC12b2lkIGRybV9mYl9oZWxwZXJfc3lzX2Nv
cHlhcmVhKHN0cnVjdCBmYl9pbmZvICppbmZvLA0KPj4gLSAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBjb25zdCBzdHJ1Y3QgZmJfY29weWFyZWEgKmFyZWEpDQo+PiAtew0KPj4g
LSAgICAgICBzdHJ1Y3QgZHJtX2ZiX2hlbHBlciAqaGVscGVyID0gaW5mby0+cGFyOw0KPj4g
LQ0KPj4gLSAgICAgICBzeXNfY29weWFyZWEoaW5mbywgYXJlYSk7DQo+PiAtDQo+PiAtICAg
ICAgIGlmIChoZWxwZXItPmZ1bmNzLT5mYl9kaXJ0eSkNCj4+IC0gICAgICAgICAgICAgICBk
cm1fZmJfaGVscGVyX2RhbWFnZShoZWxwZXIsIGFyZWEtPmR4LCBhcmVhLT5keSwgYXJlYS0+
d2lkdGgsIGFyZWEtPmhlaWdodCk7DQo+PiAtfQ0KPj4gLUVYUE9SVF9TWU1CT0woZHJtX2Zi
X2hlbHBlcl9zeXNfY29weWFyZWEpOw0KPj4gLQ0KPj4gLS8qKg0KPj4gLSAqIGRybV9mYl9o
ZWxwZXJfc3lzX2ltYWdlYmxpdCAtIHdyYXBwZXIgYXJvdW5kIHN5c19pbWFnZWJsaXQNCj4+
IC0gKiBAaW5mbzogZmJkZXYgcmVnaXN0ZXJlZCBieSB0aGUgaGVscGVyDQo+PiAtICogQGlt
YWdlOiBpbmZvIGFib3V0IGltYWdlIHRvIGJsaXQNCj4+IC0gKg0KPj4gLSAqIEEgd3JhcHBl
ciBhcm91bmQgc3lzX2ltYWdlYmxpdCBpbXBsZW1lbnRlZCBieSBmYmRldiBjb3JlDQo+PiAt
ICovDQo+PiAtdm9pZCBkcm1fZmJfaGVscGVyX3N5c19pbWFnZWJsaXQoc3RydWN0IGZiX2lu
Zm8gKmluZm8sDQo+PiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb25zdCBz
dHJ1Y3QgZmJfaW1hZ2UgKmltYWdlKQ0KPj4gLXsNCj4+IC0gICAgICAgc3RydWN0IGRybV9m
Yl9oZWxwZXIgKmhlbHBlciA9IGluZm8tPnBhcjsNCj4+IC0NCj4+IC0gICAgICAgc3lzX2lt
YWdlYmxpdChpbmZvLCBpbWFnZSk7DQo+PiAtDQo+PiAtICAgICAgIGlmIChoZWxwZXItPmZ1
bmNzLT5mYl9kaXJ0eSkNCj4+IC0gICAgICAgICAgICAgICBkcm1fZmJfaGVscGVyX2RhbWFn
ZShoZWxwZXIsIGltYWdlLT5keCwgaW1hZ2UtPmR5LCBpbWFnZS0+d2lkdGgsIGltYWdlLT5o
ZWlnaHQpOw0KPj4gLX0NCj4+IC1FWFBPUlRfU1lNQk9MKGRybV9mYl9oZWxwZXJfc3lzX2lt
YWdlYmxpdCk7DQo+PiAtDQo+PiAgIC8qKg0KPj4gICAgKiBkcm1fZmJfaGVscGVyX2NmYl9y
ZWFkIC0gSW1wbGVtZW50cyBzdHJ1Y3QgJmZiX29wcy5mYl9yZWFkIGZvciBJL08gbWVtb3J5
DQo+PiAgICAqIEBpbmZvOiBmYl9pbmZvIHN0cnVjdCBwb2ludGVyDQo+PiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2RybV9mYmRldl9nZW5lcmljLmMgYi9kcml2ZXJzL2dwdS9k
cm0vZHJtX2ZiZGV2X2dlbmVyaWMuYw0KPj4gaW5kZXggOGU1MTQ4YmY0MGJiLi5mNTNmYzQ5
ZTM0YTQgMTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2ZiZGV2X2dlbmVy
aWMuYw0KPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9mYmRldl9nZW5lcmljLmMNCj4+
IEBAIC0zNCw2ICszNCw0MyBAQCBzdGF0aWMgaW50IGRybV9mYmRldl9nZW5lcmljX2ZiX3Jl
bGVhc2Uoc3RydWN0IGZiX2luZm8gKmluZm8sIGludCB1c2VyKQ0KPj4gICAgICAgICAgcmV0
dXJuIDA7DQo+PiAgIH0NCj4+DQo+PiArc3RhdGljIHNzaXplX3QgZHJtX2ZiZGV2X2dlbmVy
aWNfZmJfd3JpdGUoc3RydWN0IGZiX2luZm8gKmluZm8sIGNvbnN0IGNoYXIgX191c2VyICpi
dWYsDQo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzaXpl
X3QgY291bnQsIGxvZmZfdCAqcHBvcykNCj4+ICt7DQo+PiArICAgICAgIHN0cnVjdCBkcm1f
ZmJfaGVscGVyICpoZWxwZXIgPSBpbmZvLT5wYXI7DQo+PiArICAgICAgIGxvZmZfdCBwb3Mg
PSAqcHBvczsNCj4+ICsgICAgICAgc3NpemVfdCByZXQ7DQo+PiArDQo+PiArICAgICAgIHJl
dCA9IGZiX3N5c193cml0ZShpbmZvLCBidWYsIGNvdW50LCBwcG9zKTsNCj4+ICsgICAgICAg
aWYgKHJldCA+IDApDQo+PiArICAgICAgICAgICAgICAgZHJtX2ZiX2hlbHBlcl9kYW1hZ2Vf
cmFuZ2UoaGVscGVyLCBwb3MsIHJldCk7DQo+PiArICAgICAgIHJldHVybiByZXQ7DQo+PiAr
fQ0KPj4gKw0KPj4gK3N0YXRpYyB2b2lkIGRybV9mYmRldl9nZW5lcmljX2ZiX2ZpbGxyZWN0
KHN0cnVjdCBmYl9pbmZvICppbmZvLCBjb25zdCBzdHJ1Y3QgZmJfZmlsbHJlY3QgKnJlY3Qp
DQo+PiArew0KPj4gKyAgICAgICBzdHJ1Y3QgZHJtX2ZiX2hlbHBlciAqaGVscGVyID0gaW5m
by0+cGFyOw0KPj4gKw0KPj4gKyAgICAgICBzeXNfZmlsbHJlY3QoaW5mbywgcmVjdCk7DQo+
PiArICAgICAgIGRybV9mYl9oZWxwZXJfZGFtYWdlKGhlbHBlciwgcmVjdC0+ZHgsIHJlY3Qt
PmR5LCByZWN0LT53aWR0aCwgcmVjdC0+aGVpZ2h0KTsNCj4+ICt9DQo+PiArDQo+PiArc3Rh
dGljIHZvaWQgZHJtX2ZiZGV2X2dlbmVyaWNfZmJfY29weWFyZWEoc3RydWN0IGZiX2luZm8g
KmluZm8sIGNvbnN0IHN0cnVjdCBmYl9jb3B5YXJlYSAqYXJlYSkNCj4+ICt7DQo+PiArICAg
ICAgIHN0cnVjdCBkcm1fZmJfaGVscGVyICpoZWxwZXIgPSBpbmZvLT5wYXI7DQo+PiArDQo+
PiArICAgICAgIHN5c19jb3B5YXJlYShpbmZvLCBhcmVhKTsNCj4+ICsgICAgICAgZHJtX2Zi
X2hlbHBlcl9kYW1hZ2UoaGVscGVyLCBhcmVhLT5keCwgYXJlYS0+ZHksIGFyZWEtPndpZHRo
LCBhcmVhLT5oZWlnaHQpOw0KPj4gK30NCj4+ICsNCj4+ICtzdGF0aWMgdm9pZCBkcm1fZmJk
ZXZfZ2VuZXJpY19mYl9pbWFnZWJsaXQoc3RydWN0IGZiX2luZm8gKmluZm8sIGNvbnN0IHN0
cnVjdCBmYl9pbWFnZSAqaW1hZ2UpDQo+PiArew0KPj4gKyAgICAgICBzdHJ1Y3QgZHJtX2Zi
X2hlbHBlciAqaGVscGVyID0gaW5mby0+cGFyOw0KPj4gKw0KPj4gKyAgICAgICBzeXNfaW1h
Z2VibGl0KGluZm8sIGltYWdlKTsNCj4+ICsgICAgICAgZHJtX2ZiX2hlbHBlcl9kYW1hZ2Uo
aGVscGVyLCBpbWFnZS0+ZHgsIGltYWdlLT5keSwgaW1hZ2UtPndpZHRoLCBpbWFnZS0+aGVp
Z2h0KTsNCj4+ICt9DQo+PiArDQo+PiAgIHN0YXRpYyB2b2lkIGRybV9mYmRldl9nZW5lcmlj
X2ZiX2Rlc3Ryb3koc3RydWN0IGZiX2luZm8gKmluZm8pDQo+PiAgIHsNCj4+ICAgICAgICAg
IHN0cnVjdCBkcm1fZmJfaGVscGVyICpmYl9oZWxwZXIgPSBpbmZvLT5wYXI7DQo+PiBAQCAt
NTYsMTIgKzkzLDEyIEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZmJfb3BzIGRybV9mYmRldl9n
ZW5lcmljX2ZiX29wcyA9IHsNCj4+ICAgICAgICAgIC5vd25lciAgICAgICAgICA9IFRISVNf
TU9EVUxFLA0KPj4gICAgICAgICAgLmZiX29wZW4gICAgICAgID0gZHJtX2ZiZGV2X2dlbmVy
aWNfZmJfb3BlbiwNCj4+ICAgICAgICAgIC5mYl9yZWxlYXNlICAgICA9IGRybV9mYmRldl9n
ZW5lcmljX2ZiX3JlbGVhc2UsDQo+PiAtICAgICAgIC5mYl9yZWFkICAgICAgICA9IGRybV9m
Yl9oZWxwZXJfc3lzX3JlYWQsDQo+PiAtICAgICAgIC5mYl93cml0ZSAgICAgICA9IGRybV9m
Yl9oZWxwZXJfc3lzX3dyaXRlLA0KPj4gKyAgICAgICAuZmJfcmVhZCAgICAgICAgPSBmYl9z
eXNfcmVhZCwNCj4+ICsgICAgICAgLmZiX3dyaXRlICAgICAgID0gZHJtX2ZiZGV2X2dlbmVy
aWNfZmJfd3JpdGUsDQo+PiAgICAgICAgICBEUk1fRkJfSEVMUEVSX0RFRkFVTFRfT1BTLA0K
Pj4gLSAgICAgICAuZmJfZmlsbHJlY3QgICAgPSBkcm1fZmJfaGVscGVyX3N5c19maWxscmVj
dCwNCj4+IC0gICAgICAgLmZiX2NvcHlhcmVhICAgID0gZHJtX2ZiX2hlbHBlcl9zeXNfY29w
eWFyZWEsDQo+PiAtICAgICAgIC5mYl9pbWFnZWJsaXQgICA9IGRybV9mYl9oZWxwZXJfc3lz
X2ltYWdlYmxpdCwNCj4+ICsgICAgICAgLmZiX2ZpbGxyZWN0ICAgID0gZHJtX2ZiZGV2X2dl
bmVyaWNfZmJfZmlsbHJlY3QsDQo+PiArICAgICAgIC5mYl9jb3B5YXJlYSAgICA9IGRybV9m
YmRldl9nZW5lcmljX2ZiX2NvcHlhcmVhLA0KPj4gKyAgICAgICAuZmJfaW1hZ2VibGl0ICAg
PSBkcm1fZmJkZXZfZ2VuZXJpY19mYl9pbWFnZWJsaXQsDQo+PiAgICAgICAgICAuZmJfbW1h
cCAgICAgICAgPSBmYl9kZWZlcnJlZF9pb19tbWFwLA0KPj4gICAgICAgICAgLmZiX2Rlc3Ry
b3kgICAgID0gZHJtX2ZiZGV2X2dlbmVyaWNfZmJfZGVzdHJveSwNCj4+ICAgfTsNCj4+IGRp
ZmYgLS1naXQgYS9pbmNsdWRlL2RybS9kcm1fZmJfaGVscGVyLmggYi9pbmNsdWRlL2RybS9k
cm1fZmJfaGVscGVyLmgNCj4+IGluZGV4IDgwYzQwMmY0ZTM3OS4uZTMyNDBkNzQ5YTQzIDEw
MDY0NA0KPj4gLS0tIGEvaW5jbHVkZS9kcm0vZHJtX2ZiX2hlbHBlci5oDQo+PiArKysgYi9p
bmNsdWRlL2RybS9kcm1fZmJfaGVscGVyLmgNCj4+IEBAIC0yNTksMTggKzI1OSw2IEBAIHZv
aWQgZHJtX2ZiX2hlbHBlcl9kYW1hZ2VfcmFuZ2Uoc3RydWN0IGRybV9mYl9oZWxwZXIgKmhl
bHBlciwgb2ZmX3Qgb2ZmLCBzaXplX3QNCj4+DQo+PiAgIHZvaWQgZHJtX2ZiX2hlbHBlcl9k
ZWZlcnJlZF9pbyhzdHJ1Y3QgZmJfaW5mbyAqaW5mbywgc3RydWN0IGxpc3RfaGVhZCAqcGFn
ZXJlZmxpc3QpOw0KPj4NCj4+IC1zc2l6ZV90IGRybV9mYl9oZWxwZXJfc3lzX3JlYWQoc3Ry
dWN0IGZiX2luZm8gKmluZm8sIGNoYXIgX191c2VyICpidWYsDQo+PiAtICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgc2l6ZV90IGNvdW50LCBsb2ZmX3QgKnBwb3MpOw0KPj4gLXNz
aXplX3QgZHJtX2ZiX2hlbHBlcl9zeXNfd3JpdGUoc3RydWN0IGZiX2luZm8gKmluZm8sIGNv
bnN0IGNoYXIgX191c2VyICpidWYsDQo+PiAtICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHNpemVfdCBjb3VudCwgbG9mZl90ICpwcG9zKTsNCj4+IC0NCj4+IC12b2lkIGRybV9m
Yl9oZWxwZXJfc3lzX2ZpbGxyZWN0KHN0cnVjdCBmYl9pbmZvICppbmZvLA0KPj4gLSAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBjb25zdCBzdHJ1Y3QgZmJfZmlsbHJlY3QgKnJl
Y3QpOw0KPj4gLXZvaWQgZHJtX2ZiX2hlbHBlcl9zeXNfY29weWFyZWEoc3RydWN0IGZiX2lu
Zm8gKmluZm8sDQo+PiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IHN0
cnVjdCBmYl9jb3B5YXJlYSAqYXJlYSk7DQo+PiAtdm9pZCBkcm1fZmJfaGVscGVyX3N5c19p
bWFnZWJsaXQoc3RydWN0IGZiX2luZm8gKmluZm8sDQo+PiAtICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBjb25zdCBzdHJ1Y3QgZmJfaW1hZ2UgKmltYWdlKTsNCj4+IC0NCj4+
ICAgc3NpemVfdCBkcm1fZmJfaGVscGVyX2NmYl9yZWFkKHN0cnVjdCBmYl9pbmZvICppbmZv
LCBjaGFyIF9fdXNlciAqYnVmLA0KPj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBzaXplX3QgY291bnQsIGxvZmZfdCAqcHBvcyk7DQo+PiAgIHNzaXplX3QgZHJtX2ZiX2hl
bHBlcl9jZmJfd3JpdGUoc3RydWN0IGZiX2luZm8gKmluZm8sIGNvbnN0IGNoYXIgX191c2Vy
ICpidWYsDQo+PiBAQCAtMzk4LDM1ICszODYsNiBAQCBzdGF0aWMgaW5saW5lIGludCBkcm1f
ZmJfaGVscGVyX2RlZmlvX2luaXQoc3RydWN0IGRybV9mYl9oZWxwZXIgKmZiX2hlbHBlcikN
Cj4+ICAgICAgICAgIHJldHVybiAtRU5PREVWOw0KPj4gICB9DQo+Pg0KPj4gLXN0YXRpYyBp
bmxpbmUgc3NpemVfdCBkcm1fZmJfaGVscGVyX3N5c19yZWFkKHN0cnVjdCBmYl9pbmZvICpp
bmZvLA0KPj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
Y2hhciBfX3VzZXIgKmJ1Ziwgc2l6ZV90IGNvdW50LA0KPj4gLSAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgbG9mZl90ICpwcG9zKQ0KPj4gLXsNCj4+IC0g
ICAgICAgcmV0dXJuIC1FTk9ERVY7DQo+PiAtfQ0KPj4gLQ0KPj4gLXN0YXRpYyBpbmxpbmUg
c3NpemVfdCBkcm1fZmJfaGVscGVyX3N5c193cml0ZShzdHJ1Y3QgZmJfaW5mbyAqaW5mbywN
Cj4+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb25z
dCBjaGFyIF9fdXNlciAqYnVmLA0KPj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHNpemVfdCBjb3VudCwgbG9mZl90ICpwcG9zKQ0KPj4gLXsNCj4+
IC0gICAgICAgcmV0dXJuIC1FTk9ERVY7DQo+PiAtfQ0KPj4gLQ0KPj4gLXN0YXRpYyBpbmxp
bmUgdm9pZCBkcm1fZmJfaGVscGVyX3N5c19maWxscmVjdChzdHJ1Y3QgZmJfaW5mbyAqaW5m
bywNCj4+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBj
b25zdCBzdHJ1Y3QgZmJfZmlsbHJlY3QgKnJlY3QpDQo+PiAtew0KPj4gLX0NCj4+IC0NCj4+
IC1zdGF0aWMgaW5saW5lIHZvaWQgZHJtX2ZiX2hlbHBlcl9zeXNfY29weWFyZWEoc3RydWN0
IGZiX2luZm8gKmluZm8sDQo+PiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgY29uc3Qgc3RydWN0IGZiX2NvcHlhcmVhICphcmVhKQ0KPj4gLXsNCj4+
IC19DQo+PiAtDQo+PiAtc3RhdGljIGlubGluZSB2b2lkIGRybV9mYl9oZWxwZXJfc3lzX2lt
YWdlYmxpdChzdHJ1Y3QgZmJfaW5mbyAqaW5mbywNCj4+IC0gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgY29uc3Qgc3RydWN0IGZiX2ltYWdlICppbWFn
ZSkNCj4+IC17DQo+PiAtfQ0KPj4gLQ0KPj4gICBzdGF0aWMgaW5saW5lIHNzaXplX3QgZHJt
X2ZiX2hlbHBlcl9jZmJfcmVhZChzdHJ1Y3QgZmJfaW5mbyAqaW5mbywgY2hhciBfX3VzZXIg
KmJ1ZiwNCj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBzaXplX3QgY291bnQsIGxvZmZfdCAqcHBvcykNCj4+ICAgew0KPj4gLS0NCj4+IDIuNDAu
MQ0KPj4NCj4gDQo+IA0KDQotLSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2
ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCkZy
YW5rZW5zdHJhc3NlIDE0NiwgOTA0NjEgTnVlcm5iZXJnLCBHZXJtYW55DQpHRjogSXZvIFRv
dGV2LCBBbmRyZXcgTXllcnMsIEFuZHJldyBNY0RvbmFsZCwgQm91ZGllbiBNb2VybWFuDQpI
UkIgMzY4MDkgKEFHIE51ZXJuYmVyZykNCg==

--------------FfZtj8l0tZppTLr8p1YXOL7D--

--------------u14AFYyuSD0v0kQkWCDtOTS1
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmRruIsFAwAAAAAACgkQlh/E3EQov+CZ
SRAAmcJ3UCDaqDjm+BM37lGvwiaxfTmrKNMAdZdHnDXbvd70asey2VqGXLos9z6tYe2pYnxDGSta
CII2RGAfOCfcg5kP3K8+S5cj0FEoHZqLqJ7eA+GvyG221qW1MxKOSJM4JARc6wx/cJPd9XEwp+Vp
p/z+RoRQ60+dN9JLRVUOoRHqAkxUA9ciKqr1RoTYAgfUGgbztY8go91elHEA9mYUu8/VzwPt+wEb
XsLaMI6R9xNlYqDs8WWHZNgOVmErMcFK2+zi9yTaRATm5aBsaVJit1H2ea3lpVKrzaqc+peb3XAp
ypYWcKLOZEC9+ihcSjnIGQg4J9WcxKbSYV7Sle8IhVfi/60C3/36+uvTxzG0Ykhn3i9BDXX6BcAX
i3frHJ6Ip4Nk7Xz4/+Xhii+iT6WO5lNy91FyYWECHrOxVGUj/WwwbLUilRXEvhfBn2Qvmd0/eV6z
BbSrGsNWonywLNg5QNANqH/ni7E/JfflbDa0TCF8ao9z31avaWARon+K6XBeHAHw+qBwrHnQ9iDi
F9E6mer4i45Q3tlLb8UkjEjLrzedTkhwL9HTQ9SAhWNHMjTpu1WVv4y6aUwhYDAyudfI10t/fYeG
6YN6CuXjKmtnBphW8Sb7+Rf9YKaMQr/d7t5f+DyW1iXCApv4vaCkw1qnm/E7JBNTa3Z2ViuxGT73
v90=
=mjqE
-----END PGP SIGNATURE-----

--------------u14AFYyuSD0v0kQkWCDtOTS1--
