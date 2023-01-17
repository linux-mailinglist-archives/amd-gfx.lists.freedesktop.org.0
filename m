Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F6A366D87F
	for <lists+amd-gfx@lfdr.de>; Tue, 17 Jan 2023 09:45:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E652810E525;
	Tue, 17 Jan 2023 08:45:37 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B5DD10E51E;
 Tue, 17 Jan 2023 08:45:33 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id AE5A638198;
 Tue, 17 Jan 2023 08:45:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1673945132; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XQ/I91RvTyAn543m4PJJHNBjaEipU61zDSTEKsJbpzc=;
 b=mD8gy50PTNmtPT657cvgnrFYZ4eiq+JY5FewRPVKxiKrPD3ZrkmmHDhs7b/NueJfwaQ6Zx
 3NsVzQUJUnMqxuZ5IzGxug/GeS3xQmQcPQzVFxkP7WYZvldEyx61xxMeG13L7eO5o6WD4J
 YM+Y4PWw9j6aZNhA3dOvl26D3gVjayY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1673945132;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XQ/I91RvTyAn543m4PJJHNBjaEipU61zDSTEKsJbpzc=;
 b=5k1wTD+5KCpwAkEmyaQx1FhtyHHpu0X1SKmY+tYy6UDRe6NlnHsmL2WNsO4Q7FXiUtvG3Z
 mNCuytjFmgZ+ZUCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6E2051390C;
 Tue, 17 Jan 2023 08:45:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id fcvXGSxgxmN0XwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 17 Jan 2023 08:45:32 +0000
Message-ID: <cc6366b5-6072-19b7-a2fb-648b6241b67c@suse.de>
Date: Tue, 17 Jan 2023 09:45:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 00/22] drm: Remove includes for drm_crtc_helper.h
Content-Language: en-US
To: Sam Ravnborg <sam@ravnborg.org>
References: <20230116131235.18917-1-tzimmermann@suse.de>
 <Y8W3y32sOpP3D6YX@ravnborg.org>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <Y8W3y32sOpP3D6YX@ravnborg.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------hHfIBU8oYmVysYTqyKhphGgQ"
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
Cc: linux-aspeed@lists.ozlabs.org, nouveau@lists.freedesktop.org,
 linux-mips@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 dri-devel@lists.freedesktop.org, daniel@ffwll.ch, airlied@gmail.com,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------hHfIBU8oYmVysYTqyKhphGgQ
Content-Type: multipart/mixed; boundary="------------ca1kQfdj320IiGrb7FVIvmPe";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: daniel@ffwll.ch, airlied@gmail.com, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-aspeed@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
 nouveau@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org, linux-sunxi@lists.linux.dev
Message-ID: <cc6366b5-6072-19b7-a2fb-648b6241b67c@suse.de>
Subject: Re: [PATCH 00/22] drm: Remove includes for drm_crtc_helper.h
References: <20230116131235.18917-1-tzimmermann@suse.de>
 <Y8W3y32sOpP3D6YX@ravnborg.org>
In-Reply-To: <Y8W3y32sOpP3D6YX@ravnborg.org>

--------------ca1kQfdj320IiGrb7FVIvmPe
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTYuMDEuMjMgdW0gMjE6NDcgc2NocmllYiBTYW0gUmF2bmJvcmc6DQo+IEhp
IFRob21hcy4NCj4gDQo+IE9uIE1vbiwgSmFuIDE2LCAyMDIzIGF0IDAyOjEyOjEzUE0gKzAx
MDAsIFRob21hcyBaaW1tZXJtYW5uIHdyb3RlOg0KPj4gQSBsb3Qgb2Ygc291cmNlIGZpbGVz
IGluY2x1ZGUgZHJtX2NydGNfaGVscGVyLmggZm9yIGl0cyBjb250YWluZWQNCj4+IGluY2x1
ZGUgc3RhdGVtZW50cy4gVGhpcyBsZWFkcyB0byBleGNlc3NpdmUgY29tcGlsZS10aW1lIGRl
cGVuZGVuY2llcy4NCj4+DQo+PiBXaGVyZSBwb3NzaWJsZSwgcmVtb3ZlIHRoZSBpbmNsdWRl
IHN0YXRlbWVudHMgZm9yIGRybV9jcnRjX2hlbHBlci5oDQo+PiBhbmQgaW5jbHVkZSB0aGUg
cmVxdWlyZWQgc291cmNlIGZpbGVzIGRpcmVjdGx5LiBBbHNvIHJlbW92ZSB0aGUNCj4+IGlu
Y2x1ZGUgc3RhdGVtZW50cyBmcm9tIGRybV9jcnRjX2hlbHBlci5oIGl0c2VsZiwgd2hpY2gg
ZG9lc24ndCBuZWVkDQo+PiBtb3N0IG9mIHRoZW0uDQo+IFdpdGggdGhpcyBwYXRjaHNldCBk
cm1fY3J0Y19oZWxwZXIgdXNhZ2UgaXMgcmVkdWNlZCBmcm9tIDg1IHBsYWNlcyB0byAzNQ0K
PiBwbGFjZXMuIEFuZCB0aGUgMzUgcGxhY2VzIGlzIG9ubHkgLmMgZmlsZXMuDQo+IFRoaXMg
aXMgYSB2ZXJ5IG5pY2UgcmVkdWN0aW9uIG9mIGJsb2F0ISBJIGhvcGUgdGhpcyBoYXMgYSBt
ZWFzdXJlYWJsZQ0KPiBlZmZlY3Qgb24gYnVpbGRpbmcgdGltZXMuDQoNCkkgY2Fubm90IHNh
eSB3aGF0IHRoZSBlZmZlY3QgaXMgZm9yIGEgc2luZ2xlIGhlYWRlciwgYnV0IGlmIHdlIGRv
IHRoaXMgDQpmb3IgYWxsIGhlYWRlciBmaWxlcywgdGhlIGVmZmVjdCBpcyBtZWFzdXJlYWJs
ZS4NCg0KPiANCj4gSSB3YXMgd29ya2luZyBvbiBzb21ldGhpbmcgc2ltaWxhciwgYnV0IHRo
YXQgYXBwcm9hY2ggb25seSBhZGRlZCBtaXNzaW5nDQo+IGluY2x1ZGVzLCBhbmQgZGlkIG5v
dCBraWxsIGFsbCB0aGUgdW5uZXNzZXNhcnkgaW5jbHVkZXMgLSB3aGljaCBJIHRoaW5rDQo+
IGlzIHRoZSBiaWdnZXN0IHdpbiBoZXJlLg0KPiANCj4gQWxsIHBhdGNoZXMgYXJlOg0KPiBS
ZXZpZXdlZC1ieTogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPg0KDQpUaGFuayB5
b3UuDQoNCj4gDQo+IEZvciBhIGZldyBvZiB0aGVtIHRoZSByLWIgaXMgY29uZGl0aW9uYWws
IHNlZSB0aGUgc3BlY2lmaWMgY29tbWVudHMNCj4gcG9zdGVkLg0KDQpJIGZpeGVkIGFsbCB5
b3VyIGNvbW1lbnRzLCBpbmNsdWRpbmcgdGhlIG1pbm9yIGNvbXBsYWludCBhYm91dCB0aGUg
DQpjb21taXQgbWVzc2FnZXMuDQoNCkkgZG9uJ3QgaW50ZW50IHRvIHNlbmQgb3V0IGEgdjIg
aGVyZSwgYnV0IHRoZSBmaXhlZCBwYXRjaGVzIHNob3VsZCBzb29uIA0Kc2hvdyB1cCBpbiBk
cm0tbWlzYy1uZXh0Lg0KDQpCZXN0IHJlZ2FyZHMNClRob21hcw0KDQo+IA0KPiANCj4gSSBk
aWQgYSBidWlsZCBjaGVjayBoZXJlIHdpdGggdGhlIGFyY2hzIGFuZCBjb25maWcgSSB2ZXJp
ZmllcyB3aXRoLg0KPiBUaGlzIGNvdmVycyAiYWxwaGEgYXJtIGFybTY0IHNwYXJjNjQgaTM4
NiB4ODYgcG93ZXJwYyBzMzkwIHJpc2N2IHNoIg0KPiBhbmQgZXZlcnl0aGluZyB3YXMgZmlu
ZS4gSSBoYXZlIGEgZmV3IHNwZWNpZmljIGNvbmZpZ3MgdG8gcHVsbCBpbg0KPiBkcml2ZXJz
IHRoYXQgbmVlZCBhIGJpdCBleHRyYSB0byBiZSBidWlsdC4NCj4gU28gSSBjb25zaWRlciBi
dWlsZCBjb3ZlcmFnZSBPSyBmb3IgYXBwbHlpbmcsIGJ1dCBpdCB3b3VsZCBiZSBuaWNlIHRv
DQo+IHdhaXQgYSBmZXcgZGF5cyBmb3IgdGhlIGJvdHMgdG8gdmVyaWZ5IHRvby4NCj4gDQo+
IE15IG93biB3b3JrIG9uIHNsaW1taW5nIGRybV9hdG9taWNfaGVscGVyLmggYW5kIGRybV9w
cmludC5oIHdpbGwgYmUNCj4gcmViYXNlZCBvbiB0b3Agb2YgeW91ciB3b3JrIGJlZm9yZSBJ
IGNvbnRpbnVlIGl0Lg0KPiBJIG5lZWQgdG8gbG9vayBpbnRvIHJlbW92aW5nIHVudXNlZCBp
bmNsdWRlcyB0b28uDQo+IA0KPiAJU2FtDQo+IA0KPj4NCj4+IEkgYnVpbHQgdGhpcyBwYXRj
aHNldCBvbiB4ODYtNjQsIGFhcmNoNjQgYW5kIGFybS4gSG9wZWZ1bGx5IEkgZm91bmQNCj4+
IGFsbCBpbmNsdWRlIGRlcGVuZGVuY2llcy4NCj4+DQo+PiBUaGFua3MgdG8gU2FtIFJhdm5i
b3JnIGZvciBicmluZ2luZyB0aGlzIHRvIG15IGF0dGVudGlvbi4NCj4+DQo+PiBUaG9tYXMg
WmltbWVybWFubiAoMjIpOg0KPj4gICAgZHJtL2FtZGdwdTogRml4IGNvZGluZyBzdHlsZQ0K
Pj4gICAgZHJtOiBSZW1vdmUgdW5uZWNlc3NhcnkgaW5jbHVkZSBzdGF0ZW1lbnRzIGZvciBk
cm1fY3J0Y19oZWxwZXIuaA0KPj4gICAgZHJtL2FtZGdwdTogUmVtb3ZlIHVubmVjZXNzYXJ5
IGluY2x1ZGUgc3RhdGVtZW50cyBmb3INCj4+ICAgICAgZHJtX2NydGNfaGVscGVyLmgNCj4+
ICAgIGRybS9hcm0va29tZWRhOiBSZW1vdmUgdW5uZWNlc3NhcnkgaW5jbHVkZSBzdGF0ZW1l
bnRzIGZvcg0KPj4gICAgICBkcm1fY3J0Y19oZWxwZXIuaA0KPj4gICAgZHJtL2FzcGVlZDog
UmVtb3ZlIHVubmVjZXNzYXJ5IGluY2x1ZGUgc3RhdGVtZW50cyBmb3INCj4+ICAgICAgZHJt
X2NydGNfaGVscGVyLmgNCj4+ICAgIGRybS9hc3Q6IFJlbW92ZSB1bm5lY2Vzc2FyeSBpbmNs
dWRlIHN0YXRlbWVudHMgZm9yIGRybV9jcnRjX2hlbHBlci5oDQo+PiAgICBkcm0vYnJpZGdl
OiBSZW1vdmUgdW5uZWNlc3NhcnkgaW5jbHVkZSBzdGF0ZW1lbnRzIGZvcg0KPj4gICAgICBk
cm1fY3J0Y19oZWxwZXIuaA0KPj4gICAgZHJtL2dtYTUwMDogUmVtb3ZlIHVubmVjZXNzYXJ5
IGluY2x1ZGUgc3RhdGVtZW50cyBmb3INCj4+ICAgICAgZHJtX2NydGNfaGVscGVyLmgNCj4+
ICAgIGRybS9pMmMvY2g3MDA2OiBSZW1vdmUgdW5uZWNlc3NhcnkgaW5jbHVkZSBzdGF0ZW1l
bnRzIGZvcg0KPj4gICAgICBkcm1fY3J0Y19oZWxwZXIuaA0KPj4gICAgZHJtL2luZ2VuaWM6
IFJlbW92ZSB1bm5lY2Vzc2FyeSBpbmNsdWRlIHN0YXRlbWVudHMgZm9yDQo+PiAgICAgIGRy
bV9jcnRjX2hlbHBlci5oDQo+PiAgICBkcm0va21iOiBSZW1vdmUgdW5uZWNlc3NhcnkgaW5j
bHVkZSBzdGF0ZW1lbnRzIGZvciBkcm1fY3J0Y19oZWxwZXIuaA0KPj4gICAgZHJtL2xvZ2lj
dmM6IFJlbW92ZSB1bm5lY2Vzc2FyeSBpbmNsdWRlIHN0YXRlbWVudHMgZm9yDQo+PiAgICAg
IGRybV9jcnRjX2hlbHBlci5oDQo+PiAgICBkcm0vbm91dmVhdTogUmVtb3ZlIHVubmVjZXNz
YXJ5IGluY2x1ZGUgc3RhdGVtZW50cyBmb3INCj4+ICAgICAgZHJtX2NydGNfaGVscGVyLmgN
Cj4+ICAgIGRybS9yYWRlb246IFJlbW92ZSB1bm5lY2Vzc2FyeSBpbmNsdWRlIHN0YXRlbWVu
dHMgZm9yDQo+PiAgICAgIGRybV9jcnRjX2hlbHBlci5oDQo+PiAgICBkcm0vcm9ja2NoaXA6
IFJlbW92ZSB1bm5lY2Vzc2FyeSBpbmNsdWRlIHN0YXRlbWVudHMgZm9yDQo+PiAgICAgIGRy
bV9jcnRjX2hlbHBlci5oDQo+PiAgICBkcm0vc2htb2JpbGU6IFJlbW92ZSB1bm5lY2Vzc2Fy
eSBpbmNsdWRlIHN0YXRlbWVudHMgZm9yDQo+PiAgICAgIGRybV9jcnRjX2hlbHBlci5oDQo+
PiAgICBkcm0vc3ByZDogUmVtb3ZlIHVubmVjZXNzYXJ5IGluY2x1ZGUgc3RhdGVtZW50cyBm
b3IgZHJtX2NydGNfaGVscGVyLmgNCj4+ICAgIGRybS9zdW40aTogUmVtb3ZlIHVubmVjZXNz
YXJ5IGluY2x1ZGUgc3RhdGVtZW50cyBmb3IgZHJtX2NydGNfaGVscGVyLmgNCj4+ICAgIGRy
bS90aWRzczogUmVtb3ZlIHVubmVjZXNzYXJ5IGluY2x1ZGUgc3RhdGVtZW50cyBmb3IgZHJt
X2NydGNfaGVscGVyLmgNCj4+ICAgIGRybS91ZGw6IFJlbW92ZSB1bm5lY2Vzc2FyeSBpbmNs
dWRlIHN0YXRlbWVudHMgZm9yIGRybV9jcnRjX2hlbHBlci5oDQo+PiAgICBkcm0vdmJveHZp
ZGVvOiBSZW1vdmUgdW5uZWNlc3NhcnkgaW5jbHVkZSBzdGF0ZW1lbnRzIGZvcg0KPj4gICAg
ICBkcm1fY3J0Y19oZWxwZXIuaA0KPj4gICAgZHJtL2NydGMtaGVscGVyOiBSZW1vdmUgbW9z
dCBpbmNsdWRlIHN0YXRlbWVudHMgZnJvbSBkcm1fY3J0Y19oZWxwZXIuaA0KPj4NCj4+ICAg
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Nvbm5lY3RvcnMuYyAgICAgfCAg
MiArKw0KPj4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMg
ICAgICAgICB8ICA1ICsrKy0tDQo+PiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV9kaXNwbGF5LmMgICAgICAgIHwgIDEgKw0KPj4gICBkcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfZW5jb2RlcnMuYyAgICAgICB8ICAxIC0NCj4+ICAgZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2lycS5jICAgICAgICAgICAgfCAgMSAtDQo+PiAg
IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9tb2RlLmggICAgICAgICAgIHwg
IDEgLQ0KPj4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hdG9tYmlvc19jcnRjLmMg
ICAgICAgICB8ICAxIC0NCj4+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYXRvbWJp
b3NfZW5jb2RlcnMuYyAgICAgfCAgMSAtDQo+PiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2RjZV92MTBfMC5jICAgICAgICAgICAgIHwgIDIgKysNCj4+ICAgZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvZGNlX3YxMV8wLmMgICAgICAgICAgICAgfCAgMiArKw0KPj4gICBk
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9kY2VfdjZfMC5jICAgICAgICAgICAgICB8ICAy
ICsrDQo+PiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2RjZV92OF8wLmMgICAgICAg
ICAgICAgIHwgIDIgKysNCj4+ICAgZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVk
YS9rb21lZGFfY3J0Yy5jICAgfCAgMSAtDQo+PiAgIGRyaXZlcnMvZ3B1L2RybS9hcm0vZGlz
cGxheS9rb21lZGEva29tZWRhX2ttcy5oICAgIHwgIDEgLQ0KPj4gICBkcml2ZXJzL2dwdS9k
cm0vYXNwZWVkL2FzcGVlZF9nZnhfY3J0Yy5jICAgICAgICAgICB8ICAxIC0NCj4+ICAgZHJp
dmVycy9ncHUvZHJtL2FzcGVlZC9hc3BlZWRfZ2Z4X2Rydi5jICAgICAgICAgICAgfCAgMSAt
DQo+PiAgIGRyaXZlcnMvZ3B1L2RybS9hc3BlZWQvYXNwZWVkX2dmeF9vdXQuYyAgICAgICAg
ICAgIHwgIDEgLQ0KPj4gICBkcml2ZXJzL2dwdS9kcm0vYXN0L2FzdF9kcnYuYyAgICAgICAg
ICAgICAgICAgICAgICB8ICAxIC0NCj4+ICAgZHJpdmVycy9ncHUvZHJtL2FzdC9hc3RfbWFp
bi5jICAgICAgICAgICAgICAgICAgICAgfCAgMSAtDQo+PiAgIGRyaXZlcnMvZ3B1L2RybS9h
c3QvYXN0X21vZGUuYyAgICAgICAgICAgICAgICAgICAgIHwgIDEgLQ0KPj4gICBkcml2ZXJz
L2dwdS9kcm0vYnJpZGdlL2FuYWxvZ2l4L2FuYWxvZ2l4LWFueDYzNDUuYyB8ICAxIC0NCj4+
ICAgZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9hbmFsb2dpeC9hbng3NjI1LmMgICAgICAgICAg
fCAgMSAtDQo+PiAgIC4uLi9ncHUvZHJtL2JyaWRnZS9jYWRlbmNlL2NkbnMtbWhkcDg1NDYt
Y29yZS5jICAgIHwgIDEgLQ0KPj4gICBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2l0ZS1pdDY1
MDUuYyAgICAgICAgICAgICAgICB8ICAxIC0NCj4+ICAgZHJpdmVycy9ncHUvZHJtL2JyaWRn
ZS9pdGUtaXQ2NjEyMS5jICAgICAgICAgICAgICAgfCAgMSAtDQo+PiAgIGRyaXZlcnMvZ3B1
L2RybS9icmlkZ2UvdGMzNTg3NjguYyAgICAgICAgICAgICAgICAgIHwgIDEgLQ0KPj4gICBk
cml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RjMzU4Nzc1LmMgICAgICAgICAgICAgICAgICB8ICAx
IC0NCj4+ICAgZHJpdmVycy9ncHUvZHJtL2RybV9jcnRjX2hlbHBlci5jICAgICAgICAgICAg
ICAgICAgfCAgMSAtDQo+PiAgIGRyaXZlcnMvZ3B1L2RybS9kcm1fbGVhc2UuYyAgICAgICAg
ICAgICAgICAgICAgICAgIHwgIDIgKy0NCj4+ICAgZHJpdmVycy9ncHUvZHJtL2RybV9wbGFu
ZV9oZWxwZXIuYyAgICAgICAgICAgICAgICAgfCAgMSAtDQo+PiAgIGRyaXZlcnMvZ3B1L2Ry
bS9nbWE1MDAvY2R2X2RldmljZS5jICAgICAgICAgICAgICAgIHwgIDEgKw0KPj4gICBkcml2
ZXJzL2dwdS9kcm0vZ21hNTAwL2Nkdl9pbnRlbF9jcnQuYyAgICAgICAgICAgICB8ICAyICsr
DQo+PiAgIGRyaXZlcnMvZ3B1L2RybS9nbWE1MDAvY2R2X2ludGVsX2Rpc3BsYXkuYyAgICAg
ICAgIHwgIDEgKw0KPj4gICBkcml2ZXJzL2dwdS9kcm0vZ21hNTAwL2Nkdl9pbnRlbF9kcC5j
ICAgICAgICAgICAgICB8ICAxICsNCj4+ICAgZHJpdmVycy9ncHUvZHJtL2dtYTUwMC9jZHZf
aW50ZWxfaGRtaS5jICAgICAgICAgICAgfCAgMiArKw0KPj4gICBkcml2ZXJzL2dwdS9kcm0v
Z21hNTAwL2Nkdl9pbnRlbF9sdmRzLmMgICAgICAgICAgICB8ICAyICsrDQo+PiAgIGRyaXZl
cnMvZ3B1L2RybS9nbWE1MDAvZnJhbWVidWZmZXIuYyAgICAgICAgICAgICAgIHwgIDIgKysN
Cj4+ICAgZHJpdmVycy9ncHUvZHJtL2dtYTUwMC9nbWFfZGlzcGxheS5jICAgICAgICAgICAg
ICAgfCAgMiArKw0KPj4gICBkcml2ZXJzL2dwdS9kcm0vZ21hNTAwL29ha3RyYWlsX2NydGMu
YyAgICAgICAgICAgICB8ICAxICsNCj4+ICAgZHJpdmVycy9ncHUvZHJtL2dtYTUwMC9vYWt0
cmFpbF9oZG1pLmMgICAgICAgICAgICAgfCAgMiArKw0KPj4gICBkcml2ZXJzL2dwdS9kcm0v
Z21hNTAwL29ha3RyYWlsX2x2ZHMuYyAgICAgICAgICAgICB8ICAxICsNCj4+ICAgZHJpdmVy
cy9ncHUvZHJtL2dtYTUwMC9wc2JfZGV2aWNlLmMgICAgICAgICAgICAgICAgfCAgMSArDQo+
PiAgIGRyaXZlcnMvZ3B1L2RybS9nbWE1MDAvcHNiX2ludGVsX2Rpc3BsYXkuYyAgICAgICAg
IHwgIDMgKysrDQo+PiAgIGRyaXZlcnMvZ3B1L2RybS9nbWE1MDAvcHNiX2ludGVsX2Rydi5o
ICAgICAgICAgICAgIHwgIDEgLQ0KPj4gICBkcml2ZXJzL2dwdS9kcm0vZ21hNTAwL3BzYl9p
bnRlbF9sdmRzLmMgICAgICAgICAgICB8ICAyICsrDQo+PiAgIGRyaXZlcnMvZ3B1L2RybS9n
bWE1MDAvcHNiX2ludGVsX3Nkdm8uYyAgICAgICAgICAgIHwgIDIgKysNCj4+ICAgZHJpdmVy
cy9ncHUvZHJtL2kyYy9jaDcwMDZfZHJ2LmMgICAgICAgICAgICAgICAgICAgfCAgMiArKw0K
Pj4gICBkcml2ZXJzL2dwdS9kcm0vaTJjL2NoNzAwNl9wcml2LmggICAgICAgICAgICAgICAg
ICB8ICAxIC0NCj4+ICAgZHJpdmVycy9ncHUvZHJtL2luZ2VuaWMvaW5nZW5pYy1kcm0tZHJ2
LmMgICAgICAgICAgfCAgMSAtDQo+PiAgIGRyaXZlcnMvZ3B1L2RybS9rbWIva21iX2NydGMu
YyAgICAgICAgICAgICAgICAgICAgIHwgIDEgLQ0KPj4gICBkcml2ZXJzL2dwdS9kcm0va21i
L2ttYl9wbGFuZS5jICAgICAgICAgICAgICAgICAgICB8ICAxIC0NCj4+ICAgZHJpdmVycy9n
cHUvZHJtL2xvZ2ljdmMvbG9naWN2Y19pbnRlcmZhY2UuYyAgICAgICAgfCAgMSAtDQo+PiAg
IGRyaXZlcnMvZ3B1L2RybS9sb2dpY3ZjL2xvZ2ljdmNfbW9kZS5jICAgICAgICAgICAgIHwg
IDEgLQ0KPj4gICBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9kaXNwbnYwNC9jcnRjLmMgICAg
ICAgICAgICB8ICAxICsNCj4+ICAgZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvZGlzcG52MDQv
ZGFjLmMgICAgICAgICAgICAgfCAgMiArLQ0KPj4gICBkcml2ZXJzL2dwdS9kcm0vbm91dmVh
dS9kaXNwbnYwNC9kZnAuYyAgICAgICAgICAgICB8ICAyICstDQo+PiAgIGRyaXZlcnMvZ3B1
L2RybS9ub3V2ZWF1L2Rpc3BudjA0L3R2bW9kZXNudjE3LmMgICAgIHwgIDEgLQ0KPj4gICBk
cml2ZXJzL2dwdS9kcm0vbm91dmVhdS9kaXNwbnYwNC90dm52MDQuYyAgICAgICAgICB8ICAy
ICstDQo+PiAgIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L2Rpc3BudjA0L3R2bnYxNy5jICAg
ICAgICAgIHwgIDEgKw0KPj4gICBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9kaXNwbnY1MC9o
ZWFkLmMgICAgICAgICAgICB8ICAxIC0NCj4+ICAgZHJpdmVycy9ncHUvZHJtL25vdXZlYXUv
bm91dmVhdV9kcm0uYyAgICAgICAgICAgICAgfCAgMSAtDQo+PiAgIGRyaXZlcnMvZ3B1L2Ry
bS9ub3V2ZWF1L25vdXZlYXVfdmdhLmMgICAgICAgICAgICAgIHwgIDEgLQ0KPj4gICBkcml2
ZXJzL2dwdS9kcm0vcmFkZW9uL2F0b21iaW9zX2NydGMuYyAgICAgICAgICAgICB8ICAyICst
DQo+PiAgIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vYXRvbWJpb3NfZW5jb2RlcnMuYyAgICAg
ICAgIHwgIDEgKw0KPj4gICBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3IzMDAuYyAgICAgICAg
ICAgICAgICAgICAgICB8ICAxIC0NCj4+ICAgZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRl
b25fYXNpYy5jICAgICAgICAgICAgICAgfCAgMSAtDQo+PiAgIGRyaXZlcnMvZ3B1L2RybS9y
YWRlb24vcmFkZW9uX2Nvbm5lY3RvcnMuYyAgICAgICAgIHwgIDEgKw0KPj4gICBkcml2ZXJz
L2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9kaXNwbGF5LmMgICAgICAgICAgICB8ICAxICsNCj4+
ICAgZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fZHJ2LmMgICAgICAgICAgICAgICAg
fCAgMSAtDQo+PiAgIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2VuY29kZXJzLmMg
ICAgICAgICAgIHwgIDEgLQ0KPj4gICBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9p
cnFfa21zLmMgICAgICAgICAgICB8ICAxIC0NCj4+ICAgZHJpdmVycy9ncHUvZHJtL3JhZGVv
bi9yYWRlb25fbGVnYWN5X2NydGMuYyAgICAgICAgfCAgMiArLQ0KPj4gICBkcml2ZXJzL2dw
dS9kcm0vcmFkZW9uL3JhZGVvbl9sZWdhY3lfZW5jb2RlcnMuYyAgICB8ICAyICstDQo+PiAg
IGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2xlZ2FjeV90di5jICAgICAgICAgIHwg
IDEgLQ0KPj4gICBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9tb2RlLmggICAgICAg
ICAgICAgICB8ICAyICstDQo+PiAgIGRyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9yb2NrY2hp
cF9kcm1fdm9wMi5jICAgICAgIHwgIDEgLQ0KPj4gICBkcml2ZXJzL2dwdS9kcm0vc2htb2Jp
bGUvc2htb2JfZHJtX2NydGMuYyAgICAgICAgICB8ICAyICsrDQo+PiAgIGRyaXZlcnMvZ3B1
L2RybS9zaG1vYmlsZS9zaG1vYl9kcm1fZHJ2LmMgICAgICAgICAgIHwgIDEgLQ0KPj4gICBk
cml2ZXJzL2dwdS9kcm0vc2htb2JpbGUvc2htb2JfZHJtX3BsYW5lLmMgICAgICAgICB8ICAx
IC0NCj4+ICAgZHJpdmVycy9ncHUvZHJtL3NwcmQvc3ByZF9kcHUuYyAgICAgICAgICAgICAg
ICAgICAgfCAgMSAtDQo+PiAgIGRyaXZlcnMvZ3B1L2RybS9zcHJkL3NwcmRfZHJtLmMgICAg
ICAgICAgICAgICAgICAgIHwgIDEgLQ0KPj4gICBkcml2ZXJzL2dwdS9kcm0vc3ByZC9zcHJk
X2RzaS5jICAgICAgICAgICAgICAgICAgICB8ICAxIC0NCj4+ICAgZHJpdmVycy9ncHUvZHJt
L3N1bjRpL3N1bjhpX2R3X2hkbWkuYyAgICAgICAgICAgICAgfCAgMiArLQ0KPj4gICBkcml2
ZXJzL2dwdS9kcm0vdGlkc3MvdGlkc3NfY3J0Yy5jICAgICAgICAgICAgICAgICB8ICAxIC0N
Cj4+ICAgZHJpdmVycy9ncHUvZHJtL3RpZHNzL3RpZHNzX2Rydi5jICAgICAgICAgICAgICAg
ICAgfCAgMSAtDQo+PiAgIGRyaXZlcnMvZ3B1L2RybS90aWRzcy90aWRzc19lbmNvZGVyLmMg
ICAgICAgICAgICAgIHwgIDIgKy0NCj4+ICAgZHJpdmVycy9ncHUvZHJtL3RpZHNzL3RpZHNz
X2ttcy5jICAgICAgICAgICAgICAgICAgfCAgMSAtDQo+PiAgIGRyaXZlcnMvZ3B1L2RybS90
aWRzcy90aWRzc19wbGFuZS5jICAgICAgICAgICAgICAgIHwgIDEgLQ0KPj4gICBkcml2ZXJz
L2dwdS9kcm0vdWRsL3VkbF9kcnYuYyAgICAgICAgICAgICAgICAgICAgICB8ICAyICstDQo+
PiAgIGRyaXZlcnMvZ3B1L2RybS91ZGwvdWRsX21vZGVzZXQuYyAgICAgICAgICAgICAgICAg
IHwgIDEgLQ0KPj4gICBkcml2ZXJzL2dwdS9kcm0vdmJveHZpZGVvL3Zib3hfZHJ2LmMgICAg
ICAgICAgICAgICB8ICAyICstDQo+PiAgIGRyaXZlcnMvZ3B1L2RybS92Ym94dmlkZW8vdmJv
eF9tYWluLmMgICAgICAgICAgICAgIHwgIDEgLQ0KPj4gICBpbmNsdWRlL2RybS9kcm1fY3J0
Y19oZWxwZXIuaCAgICAgICAgICAgICAgICAgICAgICB8IDE0ICsrKysrKysrKy0tLS0tDQo+
PiAgIGluY2x1ZGUvZHJtL2RybV9maXhlZC5oICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHwgIDEgKw0KPj4gICA5NCBmaWxlcyBjaGFuZ2VkLCA3MCBpbnNlcnRpb25zKCspLCA3MCBk
ZWxldGlvbnMoLSkNCj4+DQo+Pg0KPj4gYmFzZS1jb21taXQ6IDY4ZDEzOWI2MDlhOTdhODNl
N2MyMzExODlkNDg2NGFiYTRlMTY3OWINCj4+IHByZXJlcXVpc2l0ZS1wYXRjaC1pZDogMGFh
MzU5ZjYxNDRjNDAxNWMxNDBjOGE2NzUwYmUxOTA5OWM2NzZmYg0KPj4gcHJlcmVxdWlzaXRl
LXBhdGNoLWlkOiBjNjdlNWQ4ODZhNDdiN2QwMjY2ZDgxMTAwODM3NTU3ZmRhMzRjYjI0DQo+
PiBwcmVyZXF1aXNpdGUtcGF0Y2gtaWQ6IDNmMjA0NTEwZmNiZjk1MzBkNjU0MGJkOGU2MTI4
Y2NlNTk4OTg4YjYNCj4+IC0tIA0KPj4gMi4zOS4wDQoNCi0tIA0KVGhvbWFzIFppbW1lcm1h
bm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25z
IEdlcm1hbnkgR21iSA0KTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBHZXJtYW55
DQooSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpDQpHZXNjaMOkZnRzZsO8aHJlcjogSXZvIFRv
dGV2DQo=

--------------ca1kQfdj320IiGrb7FVIvmPe--

--------------hHfIBU8oYmVysYTqyKhphGgQ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmPGYCsFAwAAAAAACgkQlh/E3EQov+A+
Ug/8DQ+FuF0ZR7Hl+hj83wie+ksrVcK9YA6u9HNgq1yTUTIyePak1tSifxeFOuGMTAqBm2YV+6Ba
U8cZZBRctF8+cUrBCKiqMUlNVNweMKrpDU6d/QEPK+Db5Alus1iVvcYPSPr12BOPuSW5I42WzLMx
Xt7YxGShf3aBXbpzmnzX+8N3SCQgc11pTlgq2jJf/nAdkZvXSzi8sCRPeFnAQiO3dWPuFA4zogjq
aymheHU+rQqQ3cn62a6ilhM7y865r3MJWz9vy5G0qXbkIQ2I7Z0VVO3qSuodFaj+H8oE7+h0nGT9
yhN317zndbUpao3dPUYcOCaFp+yMIuznB7Mkgn30OhN/x8/qfOPhS5iGoZQGaWJWyGSF9Thc1xCp
CumJSItbrg/UGyg7ei5skD+njT67uDxJ1KmhcmebWdmKizTKDTvjLNtoR9oLkpen2RRWD7ATg9wU
ObBM/jvNmTlmzwdgCIRslZZBIUX++9HAwtbrRkTOmZ5GE8rDw9hJtiUh6gYCpj1BrH0mcouOxEaY
jc5QSitEi88e5WT8E/cgpqIskXXpOK/weBNn5LbFWiarQKWJ4TlhtvHmA8yvKf1yZp3fCWmNHzNC
1Ol/EzmwwhOPUaA4lmPPG5o516qDw71ABm2QfyTwmwK0wtvVnYgb95tun1ElDjVPM3x7poIl7UJX
Qns=
=wnn9
-----END PGP SIGNATURE-----

--------------hHfIBU8oYmVysYTqyKhphGgQ--
