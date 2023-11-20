Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BA007F1893
	for <lists+amd-gfx@lfdr.de>; Mon, 20 Nov 2023 17:24:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BED6210E0AC;
	Mon, 20 Nov 2023 16:24:25 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC54510E09B;
 Mon, 20 Nov 2023 16:24:22 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 0F4881F8A6;
 Mon, 20 Nov 2023 16:24:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1700497461; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=7NDXXT2yF0Wg/zf7nt1aDVdklEZX8QiEwy53ZRpAxKw=;
 b=W+ZpC8vwOc+WE2zG0uPwAckKNPl7fVfs4LlV9F3Mq9FScJ17MF3zS/VjahgsNUamUTi2Yt
 0KSstc+MQfNH3O59WlWqZygfsPuJo8RRoFZobDMhjjm+IvKlC20zuZFgahY+Ditgx0AVps
 jSvjOxYWcngdcRP1nr8CoA8jGLUcyd0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1700497461;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=7NDXXT2yF0Wg/zf7nt1aDVdklEZX8QiEwy53ZRpAxKw=;
 b=E0F+iLD0+K1F+Sb5lR4Cpl7c8IJfQVN2d7++hVYuwpZDzsGW6xF5oZmp2msuCRheRhjtTz
 OREjTIYOaiTTdODQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E85BB13499;
 Mon, 20 Nov 2023 16:24:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id P2CDNzSIW2U1bQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 20 Nov 2023 16:24:20 +0000
Message-ID: <1244077f-bfa2-421f-bea1-e370b70a3b0b@suse.de>
Date: Mon, 20 Nov 2023 17:24:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] Revert "drm/prime: Unexport helpers for fd/handle
 conversion"
Content-Language: en-US
To: Felix Kuehling <felix.kuehling@amd.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
References: <20231117214419.418556-1-Felix.Kuehling@amd.com>
 <73a16f1e-3556-49b3-bd19-8b510f6af3fd@suse.de>
 <7501fb58-9f34-4410-b529-c01e2e45e019@amd.com>
 <86a843ed-d286-4da0-9fa9-b777d783982f@suse.de>
 <c4e5254a-6c69-434a-8128-dd140ddba623@amd.com>
 <73722172-69e8-4bdf-bfe3-e7c5bbff7219@suse.de>
 <814430b0-38de-4fd5-9719-a2f7b217cb0d@amd.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Autocrypt: addr=tzimmermann@suse.de; keydata=
 xsBNBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdg
 XH47fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0
 BeB5BbqP5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4Yc
 hdHm3bkPjz9EErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB
 9GluwvIhSezPgnEmimZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEB
 AAHNJ1Rob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPsLAjgQTAQgAOAIb
 AwULCQgHAgYVCgkICwIEFgIDAQIeAQIXgBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftODH
 AAoJEGgNwR1TC3ojx1wH/0hKGWugiqDgLNXLRD/4TfHBEKmxIrmfu9Z5t7vwUKfwhFL6hqvo
 lXPJJKQpQ2z8+X2vZm/slsLn7J1yjrOsoJhKABDi+3QWWSGkaGwRJAdPVVyJMfJRNNNIKwVb
 U6B1BkX2XDKDGffF4TxlOpSQzdtNI/9gleOoUA8+jy8knnDYzjBNOZqLG2FuTdicBXblz0Mf
 vg41gd9kCwYXDnD91rJU8tzylXv03E75NCaTxTM+FBXPmsAVYQ4GYhhgFt8S2UWMoaaABLDe
 7l5FdnLdDEcbmd8uLU2CaG4W2cLrUaI4jz2XbkcPQkqTQ3EB67hYkjiEE6Zy3ggOitiQGcqp
 j//OwE0EWznS4AEIAMYmP4M/V+T5RY5at/g7rUdNsLhWv1APYrh9RQefODYHrNRHUE9eosYb
 T6XMryR9hT8XlGOYRwKWwiQBoWSDiTMo/Xi29jUnn4BXfI2px2DTXwc22LKtLAgTRjP+qbU6
 3Y0xnQN29UGDbYgyyK51DW3H0If2a3JNsheAAK+Xc9baj0LGIc8T9uiEWHBnCH+RdhgATnWW
 GKdDegUR5BkDfDg5O/FISymJBHx2Dyoklv5g4BzkgqTqwmaYzsl8UxZKvbaxq0zbehDda8lv
 hFXodNFMAgTLJlLuDYOGLK2AwbrS3Sp0AEbkpdJBb44qVlGm5bApZouHeJ/+n+7r12+lqdsA
 EQEAAcLAdgQYAQgAIAIbDBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftOH6AAoJEGgNwR1T
 C3ojVSkIALpAPkIJPQoURPb1VWjh34l0HlglmYHvZszJWTXYwavHR8+k6Baa6H7ufXNQtThR
 yIxJrQLW6rV5lm7TjhffEhxVCn37+cg0zZ3j7zIsSS0rx/aMwi6VhFJA5hfn3T0TtrijKP4A
 SAQO9xD1Zk9/61JWk8OysuIh7MXkl0fxbRKWE93XeQBhIJHQfnc+YBLprdnxR446Sh8Wn/2D
 Ya8cavuWf2zrB6cZurs048xe0UbSW5AOSo4V9M0jzYI4nZqTmPxYyXbm30Kvmz0rYVRaitYJ
 4kyYYMhuULvrJDMjZRvaNe52tkKAvMevcGdt38H4KSVXAylqyQOW5zvPc4/sq9c=
In-Reply-To: <814430b0-38de-4fd5-9719-a2f7b217cb0d@amd.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------bdeiKJuODE1jKqhIk6S3YeEF"
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -10.29
X-Spamd-Result: default: False [-10.29 / 50.00]; ARC_NA(0.00)[];
 TO_DN_EQ_ADDR_SOME(0.00)[]; XM_UA_NO_VERSION(0.01)[];
 FROM_HAS_DN(0.00)[]; RCPT_COUNT_THREE(0.00)[4];
 TO_DN_SOME(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
 HAS_ATTACHMENT(0.00)[]; REPLY(-4.00)[];
 BAYES_HAM(-3.00)[100.00%]; NEURAL_HAM_LONG(-1.00)[-1.000];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_BASE64_TEXT(0.10)[];
 SIGNED_PGP(-2.00)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 FROM_EQ_ENVFROM(0.00)[]; MIME_TRACE(0.00)[0:+,1:+,2:+,3:~];
 RCVD_COUNT_TWO(0.00)[2]; RCVD_TLS_ALL(0.00)[];
 MID_RHS_MATCH_FROM(0.00)[]
X-Spam-Flag: NO
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
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------bdeiKJuODE1jKqhIk6S3YeEF
Content-Type: multipart/mixed; boundary="------------zbKvkIQxIFinRff0gbAELO5s";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Felix Kuehling <felix.kuehling@amd.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Message-ID: <1244077f-bfa2-421f-bea1-e370b70a3b0b@suse.de>
Subject: Re: [PATCH 1/3] Revert "drm/prime: Unexport helpers for fd/handle
 conversion"
References: <20231117214419.418556-1-Felix.Kuehling@amd.com>
 <73a16f1e-3556-49b3-bd19-8b510f6af3fd@suse.de>
 <7501fb58-9f34-4410-b529-c01e2e45e019@amd.com>
 <86a843ed-d286-4da0-9fa9-b777d783982f@suse.de>
 <c4e5254a-6c69-434a-8128-dd140ddba623@amd.com>
 <73722172-69e8-4bdf-bfe3-e7c5bbff7219@suse.de>
 <814430b0-38de-4fd5-9719-a2f7b217cb0d@amd.com>
In-Reply-To: <814430b0-38de-4fd5-9719-a2f7b217cb0d@amd.com>

--------------zbKvkIQxIFinRff0gbAELO5s
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjAuMTEuMjMgdW0gMTc6MTUgc2NocmllYiBGZWxpeCBLdWVobGluZzoNCj4g
DQo+IE9uIDIwMjMtMTEtMjAgMTE6MDIsIFRob21hcyBaaW1tZXJtYW5uIHdyb3RlOg0KPj4g
SGkgQ2hyaXN0aWFuDQo+Pg0KPj4gQW0gMjAuMTEuMjMgdW0gMTY6MjIgc2NocmllYiBDaHJp
c3RpYW4gS8O2bmlnOg0KPj4+IEFtIDIwLjExLjIzIHVtIDE2OjE4IHNjaHJpZWIgVGhvbWFz
IFppbW1lcm1hbm46DQo+Pj4+IEhpDQo+Pj4+DQo+Pj4+IEFtIDIwLjExLjIzIHVtIDE2OjA2
IHNjaHJpZWIgRmVsaXggS3VlaGxpbmc6DQo+Pj4+PiBPbiAyMDIzLTExLTIwIDY6NTQsIFRo
b21hcyBaaW1tZXJtYW5uIHdyb3RlOg0KPj4+Pj4+IEhpDQo+Pj4+Pj4NCj4+Pj4+PiBBbSAx
Ny4xMS4yMyB1bSAyMjo0NCBzY2hyaWViIEZlbGl4IEt1ZWhsaW5nOg0KPj4+Pj4+PiBUaGlz
IHJldmVydHMgY29tbWl0IDcxYTc5NzRhYzcwMTlhZmVlYzEwNWE1NDQ0N2FlMWRjNzIxNmNi
YjMuDQo+Pj4+Pj4+DQo+Pj4+Pj4+IFRoZXNlIGhlbHBlciBmdW5jdGlvbnMgYXJlIG5lZWRl
ZCBmb3IgS0ZEIHRvIGV4cG9ydCBhbmQgaW1wb3J0IA0KPj4+Pj4+PiBETUFCdWZzDQo+Pj4+
Pj4+IHRoZSByaWdodCB3YXkgd2l0aG91dCBkdXBsaWNhdGluZyB0aGUgdHJhY2tpbmcgb2Yg
RE1BQnVmcw0KPj4+Pj4+PiBhc3NvY2lhdGVkIHdpdGgNCj4+Pj4+Pj4gR0VNIG9iamVjdHMg
d2hpbGUgZW5zdXJpbmcgdGhhdCBtb3ZlIG5vdGlmaWVyIGNhbGxiYWNrcyBhcmUgDQo+Pj4+
Pj4+IHdvcmtpbmcgYXMNCj4+Pj4+Pj4gaW50ZW5kZWQuDQo+Pj4+Pj4gSSdtIHVuaGFwcHkg
dG8gc2VlIHRoZXNlIGZ1bmN0aW9ucyBtYWtpbmcgYSBjb21lYmFjay4gVGhleSBhcmUgdGhl
DQo+Pj4+Pj4gYm9pbGVyLXBsYXRlIGxvZ2ljIHRoYXQgYWxsIGRyaXZlcnMgc2hvdWxkIHVz
ZS4gSGlzdG9yaWNhbGx5LA0KPj4+Pj4+IGRyaXZlcnMgZGlkIGEgbG90IG9uZSB0aGluZ3Mg
aW4gdGhlaXIgR0VNIGNvZGUgdGhhdCB3YXMgb25seQ0KPj4+Pj4+IHNlbWktY29ycmVjdC4g
VW5pZnlpbmcgbW9zdCBvZiB0aGF0IG1hZGUgdGhlIG1lbW9yeSBtYW5hZ2VtZW50IG1vcmUN
Cj4+Pj4+PiByZWFkYWJsZS4gTm90IGdpdmluZyBiYWNrIGRyaXZlcnMgdG8gb3B0aW9uIG9m
IHRpbmtlcmluZyB3aXRoIHRoaXMNCj4+Pj4+PiBtaWdodCBiZSBwcmVmZXJhYmxlLiBUaGUg
cnNwIGhvb2tzIGluIHN0cnVjdCBkcm1fZHJpdmVyLA0KPj4+Pj4+IHByaW1lX2ZkX3RvX2hh
bmRsZSBhbmQgcHJpbWVfaGFuZGxlX3RvX2ZkLCBhcmUgb25seSB0aGVyZSBmb3Igdm13Z2Z4
Lg0KPj4+Pj4+DQo+Pj4+Pj4gSWYgeW91IHdhbnQgdG8gaG9vayBpbnRvIHByaW1lIGltcG9y
dCBhbmQgZXhwb3J0LCB0aGVyZSBhcmUNCj4+Pj4+PiBkcm1fZHJpdmVyLmdlbV9wcmltZV9p
bXBvcnQgYW5kIGRybV9nZW1fb2JqZWN0X2Z1bmNzLmV4cG9ydC4gSXNuJ3QNCj4+Pj4+PiBp
dCBwb3NzaWJsZSB0byBtb3ZlIHRoZSBhZGRpdGlvbmFsIGNvZGUgYmVoaW5kIHRoZXNlIHBv
aW50ZXJzPw0KPj4+Pj4gSSdtIG5vdCB0cnlpbmcgdG8gaG9vayBpbnRvIHRoZXNlIGZ1bmN0
aW9ucywgSSdtIGp1c3QgdHJ5aW5nIHRvIGNhbGwNCj4+Pj4+IHRoZW0uIEknbSBub3QgYnJp
bmdpbmcgYmFjayB0aGUgLnByaW1lX2hhbmRsZV90b19mZCBhbmQNCj4+Pj4+IC5wcmltZV9m
ZF90b19oYW5kbGUgaG9va3MgaW4gc3RydWN0IGRybV9kcml2ZXIuIEkgbmVlZCBhIGNsZWFu
IHdheSB0bw0KPj4+Pj4gZXhwb3J0IGFuZCBpbXBvcnQgRE1BYnVmZmVycyBmcm9tIGEga2Vy
bmVsIG1vZGUgY29udGV4dC4gSSBoYWQNCj4+Pj4+IGluY29ycmVjdCBvciBzZW1pLWNvcnJl
Y3Qgd2F5cyBvZiBkb2luZyB0aGF0IGJ5IGNhbGxpbmcgc29tZQ0KPj4+Pj4gZHJpdmVyLWlu
dGVybmFsIGZ1bmN0aW9ucywgYnV0IHRoZW4gbXkgRE1BQnVmcyBhcmVuJ3QgY29ycmVjdGx5
DQo+Pj4+PiBsaW5rZWQgd2l0aCBHRU0gaGFuZGxlcyBpbiBEUk0gYW5kIG1vdmUgbm90aWZp
ZXJzIGluIGFtZGdwdSBhcmVuJ3QNCj4+Pj4+IHdvcmtpbmcgY29ycmVjdGx5Lg0KPj4+PiBJ
IHVuZGVyc3RhbmQgdGhhdC4gQnV0IHdoeSBkb24ndCB5b3UgdXNlIGRybV9kcml2ZXIuZ2Vt
X3ByaW1lX2ltcG9ydA0KPj4+PiBhbmQgZHJtX2dlbV9vYmplY3RfZnVuY3MuZXhwb3J0IHRv
IGFkZCB0aGUgYW1ka2ZkLXNwZWNpZmljIGNvZGU/IFRoZXNlDQo+Pj4+IGNhbGxiYWNrcyBh
cmUgYmVpbmcgaW52b2tlZCBmcm9tIHdpdGhpbiBkcm1fZ2VtX3ByaW1lX2ZkX3RvX2hhbmRs
ZSgpIA0KPj4+PiBhbmQNCj4+Pj4gZHJtX2dlbV9wcmltZV9oYW5kbGVfdG9fZmQoKSBhcyBw
YXJ0IG9mIHRoZSBpbXBvcnRpbmcgYW5kIGV4cG9ydGluZw0KPj4+PiBsb2dpYy4gV2l0aCB0
aGUgaW50ZW50aW9uIG9mIGRvaW5nIGRyaXZlci1zcGVjaWZpYyB0aGluZ3MuIEhlbmNlIHlv
dQ0KPj4+PiBzaG91bGQgbm90IGhhdmUgdG8gcmUtZXhwb3J0IHRoZSBpbnRlcm5hbCBkcm1f
Z2VtX3ByaW1lXypfdG9fKigpIA0KPj4+PiBoZWxwZXJzLg0KPj4+Pg0KPj4+PiBNeSBxdWVz
dGlvbiBpcyBpZiB0aGUgZXhpc3RpbmcgaG9va3MgYXJlIG5vdCBzdWl0YWJsZSBmb3IgeW91
ciBuZWVkcy4NCj4+Pj4gSWYgc28sIGhvdyBjb3VsZCB3ZSBpbXByb3ZlIHRoZW0/DQo+Pj4g
Tm8gbm8uIFlvdSBkb24ndCBzZWVtIHRvIHVuZGVyc3RhbmQgdGhlIHVzZSBjYXNlIDopIEZl
bGl4IGRvZXNuJ3QgdHJ5IHRvDQo+Pj4gaW1wbGVtZW50IGFueSBkcml2ZXItc3BlY2lmaWMg
dGhpbmdzLg0KPj4gSSBtZWFudCB0aGF0IEkgdW5kZXJzdGFuZCB0aGF0IHRoaXMgcGF0Y2hz
ZXQgaXMgbm90IGFib3V0IHNldHRpbmcNCj4+IGRybV9kcml2ZXIucHJpbWVfaGFuZGxlX3Rv
X2ZkLCBldCBhbC4NCj4+DQo+Pj4gV2hhdCBGZWxpeCB0cmllcyB0byBkbyBpcyB0byBleHBv
cnQgYSBETUEtYnVmIGhhbmRsZSBmcm9tIGtlcm5lbCBzcGFjZS4NCj4+IEZvciBleGFtcGxl
LCBsb29raW5nIGF0IHBhdGNoIDIsIGl0IGNvbnZlcnRzIGEgR0VNIGhhbmRsZSB0byBhIGZp
bGUNCj4+IGRlc2NyaXB0b3IgYW5kIHRoZW4gYXNzaWducyB0aGUgcnNwIGRtYWJ1ZiB0byBt
ZW0sIHdoaWNoIGlzIG9mIHR5cGUNCj4+IHN0cnVjdCBrZ2RfbWVtLiBGcm9tIG15IGltcHJl
c3Npb24sIHRoaXMgY291bGQgYmUgZG9uZSB3aXRoaW4gdGhlDQo+PiBleGlzdGluZyAtPmV4
cG9ydCBob29rLg0KPiANCj4gVGhhdCB3b3VsZCBza2lwIHRoZSBjYWxsIHRvIGV4cG9ydF9h
bmRfcmVnaXN0ZXJfb2JqZWN0LiBJIHRoaW5rIHRoYXQncyANCj4gd2hhdCBJJ20gY3VycmVu
dGx5IG1pc3NpbmcgdG8gc2V0IHVwIGdlbV9vYmotPmRtYWJ1Zi4NCg0KV2VsbCwgT0suIE5l
dmVybWluZC4NCg0KQmVzdCByZWdhcmRzDQpUaG9tYXMNCg0KPiANCj4gUmVnYXJkcywNCj4g
IMKgIEZlbGl4DQo+IA0KPiANCj4+DQo+PiBUaGVuIHRoZXJlJ3MgY2xvc2VfZmQoKSwgd2hp
Y2ggY2Fubm90IGdvIGludG8gLT5leHBvcnQuIEl0IGxvb2tzIGxpa2UNCj4+IHRoZSBmZCBp
c24ndCByZWFsbHkgcmVxdWlyZWQuwqAgQ291bGQgdGhlIGRybV9wcmltZV9oYW5kbGVfdG9f
ZmQoKSBiZQ0KPj4gcmV3b3JrZWQgaW50byBhIGhlbHBlciB0aGF0IGNvbnZlcnRzIHRoZSBo
YW5kbGUgdG8gdGhlIGRtYWJ1ZiB3aXRob3V0DQo+PiB0aGUgZmQ/wqAgU29tZXRoaW5nIGxp
a2UgZHJtX2dlbV9wcmltZV9oYW5kbGVfdG9fZG1hYnVmKCksIHdoaWNoIHdvdWxkDQo+PiB0
aGVuIGJlIGV4cG9ydGVkPw0KPj4NCj4+IEFuZCBJIGhhdmUgdGhlIHF1ZXN0aW9uIHdydCB0
aGUgM3JkIHBhdGNoOyBqdXN0IHRoYXQgaXQncyBhYm91dCANCj4+IGltcG9ydGluZy4NCj4+
DQo+PiAoTG9va2luZyBmdXJ0aGVyIHRocm91Z2ggdGhlIGNvZGUsIGl0IGFwcGVhcnMgdGhh
dCB0aGUgZmQgY291bGQgYmUNCj4+IHJlbW92ZWQgZnJvbSB0aGUgaGVscGVycywgdGhlIGNh
bGxiYWNrcyBhbmQgdm13Z2Z4LiBJdCB3b3VsZCB0aGVuIGJlDQo+PiB1c2VkIGVudGlyZWx5
IGluIHRoZSBpb2N0bCBlbnRyeSBwb2ludHMsIHN1Y2ggYXMNCj4+IGRybV9wcmltZV9mZF90
b19oYW5kbGVfaW9jdGwoKS4pDQo+Pg0KPj4gQmVzdCByZWdhcmRzDQo+PiBUaG9tYXMNCj4+
DQo+Pg0KPj4+IFJlZ2FyZHMsDQo+Pj4gQ2hyaXN0aWFuLg0KPj4+DQo+Pj4+IEJlc3QgcmVn
YXJkcw0KPj4+PiBUaG9tYXMNCj4+Pj4NCj4+Pj4NCj4+Pj4+IFJlZ2FyZHMsDQo+Pj4+PiDC
oMKgwqAgRmVsaXgNCj4+Pj4+DQo+Pj4+Pg0KPj4+Pj4+IEJlc3QgcmVnYXJkcw0KPj4+Pj4+
IFRob21hcw0KPj4+Pj4+DQo+Pj4+Pj4+IENDOiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3Rp
YW4ua29lbmlnQGFtZC5jb20+DQo+Pj4+Pj4+IENDOiBUaG9tYXMgWmltbWVybWFubiA8dHpp
bW1lcm1hbm5Ac3VzZS5kZT4NCj4+Pj4+Pj4gU2lnbmVkLW9mZi1ieTogRmVsaXggS3VlaGxp
bmcgPEZlbGl4Lkt1ZWhsaW5nQGFtZC5jb20+DQo+Pj4+Pj4+IC0tLQ0KPj4+Pj4+PiDCoMKg
IGRyaXZlcnMvZ3B1L2RybS9kcm1fcHJpbWUuYyB8IDMzIA0KPj4+Pj4+PiArKysrKysrKysr
KysrKysrKystLS0tLS0tLS0tLS0tLS0NCj4+Pj4+Pj4gwqDCoCBpbmNsdWRlL2RybS9kcm1f
cHJpbWUuaMKgwqDCoMKgIHzCoCA3ICsrKysrKysNCj4+Pj4+Pj4gwqDCoCAyIGZpbGVzIGNo
YW5nZWQsIDI1IGluc2VydGlvbnMoKyksIDE1IGRlbGV0aW9ucygtKQ0KPj4+Pj4+Pg0KPj4+
Pj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9wcmltZS5jIA0KPj4+Pj4+
PiBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fcHJpbWUuYw0KPj4+Pj4+PiBpbmRleCA2M2I3MDlh
Njc0NzEuLjgzNGE1ZTI4YWJiZSAxMDA2NDQNCj4+Pj4+Pj4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2RybV9wcmltZS5jDQo+Pj4+Pj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fcHJp
bWUuYw0KPj4+Pj4+PiBAQCAtMjc4LDcgKzI3OCw3IEBAIHZvaWQgZHJtX2dlbV9kbWFidWZf
cmVsZWFzZShzdHJ1Y3QgZG1hX2J1Zg0KPj4+Pj4+PiAqZG1hX2J1ZikNCj4+Pj4+Pj4gwqDC
oCB9DQo+Pj4+Pj4+IMKgwqAgRVhQT1JUX1NZTUJPTChkcm1fZ2VtX2RtYWJ1Zl9yZWxlYXNl
KTsNCj4+Pj4+Pj4gwqDCoCAtLyoNCj4+Pj4+Pj4gKy8qKg0KPj4+Pj4+PiDCoMKgwqAgKiBk
cm1fZ2VtX3ByaW1lX2ZkX3RvX2hhbmRsZSAtIFBSSU1FIGltcG9ydCBmdW5jdGlvbiBmb3Ig
R0VNDQo+Pj4+Pj4+IGRyaXZlcnMNCj4+Pj4+Pj4gwqDCoMKgICogQGRldjogZHJtX2Rldmlj
ZSB0byBpbXBvcnQgaW50bw0KPj4+Pj4+PiDCoMKgwqAgKiBAZmlsZV9wcml2OiBkcm0gZmls
ZS1wcml2YXRlIHN0cnVjdHVyZQ0KPj4+Pj4+PiBAQCAtMjkyLDkgKzI5Miw5IEBAIEVYUE9S
VF9TWU1CT0woZHJtX2dlbV9kbWFidWZfcmVsZWFzZSk7DQo+Pj4+Pj4+IMKgwqDCoCAqDQo+
Pj4+Pj4+IMKgwqDCoCAqIFJldHVybnMgMCBvbiBzdWNjZXNzIG9yIGEgbmVnYXRpdmUgZXJy
b3IgY29kZSBvbiBmYWlsdXJlLg0KPj4+Pj4+PiDCoMKgwqAgKi8NCj4+Pj4+Pj4gLXN0YXRp
YyBpbnQgZHJtX2dlbV9wcmltZV9mZF90b19oYW5kbGUoc3RydWN0IGRybV9kZXZpY2UgKmRl
diwNCj4+Pj4+Pj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBzdHJ1Y3QgZHJtX2ZpbGUgKmZpbGVfcHJpdiwgaW50IHByaW1lX2ZkLA0KPj4+Pj4+PiAt
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHVpbnQzMl90ICpo
YW5kbGUpDQo+Pj4+Pj4+ICtpbnQgZHJtX2dlbV9wcmltZV9mZF90b19oYW5kbGUoc3RydWN0
IGRybV9kZXZpY2UgKmRldiwNCj4+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBzdHJ1Y3QgZHJtX2ZpbGUgKmZpbGVfcHJpdiwgaW50IHByaW1lX2ZkLA0K
Pj4+Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHVpbnQzMl90
ICpoYW5kbGUpDQo+Pj4+Pj4+IMKgwqAgew0KPj4+Pj4+PiDCoMKgwqDCoMKgwqAgc3RydWN0
IGRtYV9idWYgKmRtYV9idWY7DQo+Pj4+Pj4+IMKgwqDCoMKgwqDCoCBzdHJ1Y3QgZHJtX2dl
bV9vYmplY3QgKm9iajsNCj4+Pj4+Pj4gQEAgLTM2MCw2ICszNjAsNyBAQCBzdGF0aWMgaW50
IGRybV9nZW1fcHJpbWVfZmRfdG9faGFuZGxlKHN0cnVjdA0KPj4+Pj4+PiBkcm1fZGV2aWNl
ICpkZXYsDQo+Pj4+Pj4+IMKgwqDCoMKgwqDCoCBkbWFfYnVmX3B1dChkbWFfYnVmKTsNCj4+
Pj4+Pj4gwqDCoMKgwqDCoMKgIHJldHVybiByZXQ7DQo+Pj4+Pj4+IMKgwqAgfQ0KPj4+Pj4+
PiArRVhQT1JUX1NZTUJPTChkcm1fZ2VtX3ByaW1lX2ZkX3RvX2hhbmRsZSk7DQo+Pj4+Pj4+
IMKgwqAgwqAgaW50IGRybV9wcmltZV9mZF90b19oYW5kbGVfaW9jdGwoc3RydWN0IGRybV9k
ZXZpY2UgKmRldiwgdm9pZA0KPj4+Pj4+PiAqZGF0YSwNCj4+Pj4+Pj4gwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3RydWN0IGRybV9maWxlICpmaWxlX3ByaXYp
DQo+Pj4+Pj4+IEBAIC00MDgsNyArNDA5LDcgQEAgc3RhdGljIHN0cnVjdCBkbWFfYnVmDQo+
Pj4+Pj4+ICpleHBvcnRfYW5kX3JlZ2lzdGVyX29iamVjdChzdHJ1Y3QgZHJtX2RldmljZSAq
ZGV2LA0KPj4+Pj4+PiDCoMKgwqDCoMKgwqAgcmV0dXJuIGRtYWJ1ZjsNCj4+Pj4+Pj4gwqDC
oCB9DQo+Pj4+Pj4+IMKgwqAgLS8qDQo+Pj4+Pj4+ICsvKioNCj4+Pj4+Pj4gwqDCoMKgICog
ZHJtX2dlbV9wcmltZV9oYW5kbGVfdG9fZmQgLSBQUklNRSBleHBvcnQgZnVuY3Rpb24gZm9y
IEdFTQ0KPj4+Pj4+PiBkcml2ZXJzDQo+Pj4+Pj4+IMKgwqDCoCAqIEBkZXY6IGRldiB0byBl
eHBvcnQgdGhlIGJ1ZmZlciBmcm9tDQo+Pj4+Pj4+IMKgwqDCoCAqIEBmaWxlX3ByaXY6IGRy
bSBmaWxlLXByaXZhdGUgc3RydWN0dXJlDQo+Pj4+Pj4+IEBAIC00MjEsMTAgKzQyMiwxMCBA
QCBzdGF0aWMgc3RydWN0IGRtYV9idWYNCj4+Pj4+Pj4gKmV4cG9ydF9hbmRfcmVnaXN0ZXJf
b2JqZWN0KHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsDQo+Pj4+Pj4+IMKgwqDCoCAqIFRoZSBh
Y3R1YWwgZXhwb3J0aW5nIGZyb20gR0VNIG9iamVjdCB0byBhIGRtYS1idWYgaXMgZG9uZQ0K
Pj4+Pj4+PiB0aHJvdWdoIHRoZQ0KPj4+Pj4+PiDCoMKgwqAgKiAmZHJtX2dlbV9vYmplY3Rf
ZnVuY3MuZXhwb3J0IGNhbGxiYWNrLg0KPj4+Pj4+PiDCoMKgwqAgKi8NCj4+Pj4+Pj4gLXN0
YXRpYyBpbnQgZHJtX2dlbV9wcmltZV9oYW5kbGVfdG9fZmQoc3RydWN0IGRybV9kZXZpY2Ug
KmRldiwNCj4+Pj4+Pj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBzdHJ1Y3QgZHJtX2ZpbGUgKmZpbGVfcHJpdiwgdWludDMyX3QgaGFuZGxlLA0KPj4+
Pj4+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHVpbnQz
Ml90IGZsYWdzLA0KPj4+Pj4+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIGludCAqcHJpbWVfZmQpDQo+Pj4+Pj4+ICtpbnQgZHJtX2dlbV9wcmltZV9o
YW5kbGVfdG9fZmQoc3RydWN0IGRybV9kZXZpY2UgKmRldiwNCj4+Pj4+Pj4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzdHJ1Y3QgZHJtX2ZpbGUgKmZpbGVfcHJp
diwgdWludDMyX3QgaGFuZGxlLA0KPj4+Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIHVpbnQzMl90IGZsYWdzLA0KPj4+Pj4+PiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIGludCAqcHJpbWVfZmQpDQo+Pj4+Pj4+IMKgwqAgew0K
Pj4+Pj4+PiDCoMKgwqDCoMKgwqAgc3RydWN0IGRybV9nZW1fb2JqZWN0ICpvYmo7DQo+Pj4+
Pj4+IMKgwqDCoMKgwqDCoCBpbnQgcmV0ID0gMDsNCj4+Pj4+Pj4gQEAgLTUwNiw2ICs1MDcs
NyBAQCBzdGF0aWMgaW50IGRybV9nZW1fcHJpbWVfaGFuZGxlX3RvX2ZkKHN0cnVjdA0KPj4+
Pj4+PiBkcm1fZGV2aWNlICpkZXYsDQo+Pj4+Pj4+IMKgwqAgwqDCoMKgwqDCoCByZXR1cm4g
cmV0Ow0KPj4+Pj4+PiDCoMKgIH0NCj4+Pj4+Pj4gK0VYUE9SVF9TWU1CT0woZHJtX2dlbV9w
cmltZV9oYW5kbGVfdG9fZmQpOw0KPj4+Pj4+PiDCoMKgIMKgIGludCBkcm1fcHJpbWVfaGFu
ZGxlX3RvX2ZkX2lvY3RsKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHZvaWQNCj4+Pj4+Pj4g
KmRhdGEsDQo+Pj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IHN0cnVjdCBkcm1fZmlsZSAqZmlsZV9wcml2KQ0KPj4+Pj4+PiBAQCAtODY0LDkgKzg2Niw5
IEBAIEVYUE9SVF9TWU1CT0woZHJtX3ByaW1lX2dldF9jb250aWd1b3VzX3NpemUpOw0KPj4+
Pj4+PiDCoMKgwqAgKiBAb2JqOiBHRU0gb2JqZWN0IHRvIGV4cG9ydA0KPj4+Pj4+PiDCoMKg
wqAgKiBAZmxhZ3M6IGZsYWdzIGxpa2UgRFJNX0NMT0VYRUMgYW5kIERSTV9SRFdSDQo+Pj4+
Pj4+IMKgwqDCoCAqDQo+Pj4+Pj4+IC0gKiBUaGlzIGlzIHRoZSBpbXBsZW1lbnRhdGlvbiBv
ZiB0aGUgJmRybV9nZW1fb2JqZWN0X2Z1bmNzLmV4cG9ydA0KPj4+Pj4+PiBmdW5jdGlvbnMN
Cj4+Pj4+Pj4gLSAqIGZvciBHRU0gZHJpdmVycyB1c2luZyB0aGUgUFJJTUUgaGVscGVycy4g
SXQgaXMgdXNlZCBhcyB0aGUNCj4+Pj4+Pj4gZGVmYXVsdCBmb3INCj4+Pj4+Pj4gLSAqIGRy
aXZlcnMgdGhhdCBkbyBub3Qgc2V0IHRoZWlyIG93bi4NCj4+Pj4+Pj4gKyAqIFRoaXMgaXMg
dGhlIGltcGxlbWVudGF0aW9uIG9mIHRoZSAmZHJtX2dlbV9vYmplY3RfZnVuY3MuZXhwb3J0
DQo+Pj4+Pj4+IGZ1bmN0aW9ucyBmb3IgR0VNIGRyaXZlcnMNCj4+Pj4+Pj4gKyAqIHVzaW5n
IHRoZSBQUklNRSBoZWxwZXJzLiBJdCBpcyB1c2VkIGFzIHRoZSBkZWZhdWx0IGluDQo+Pj4+
Pj4+ICsgKiBkcm1fZ2VtX3ByaW1lX2hhbmRsZV90b19mZCgpLg0KPj4+Pj4+PiDCoMKgwqAg
Ki8NCj4+Pj4+Pj4gwqDCoCBzdHJ1Y3QgZG1hX2J1ZiAqZHJtX2dlbV9wcmltZV9leHBvcnQo
c3RydWN0IGRybV9nZW1fb2JqZWN0ICpvYmosDQo+Pj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaW50IGZsYWdzKQ0KPj4+Pj4+PiBAQCAt
OTYyLDkgKzk2NCwxMCBAQCBFWFBPUlRfU1lNQk9MKGRybV9nZW1fcHJpbWVfaW1wb3J0X2Rl
dik7DQo+Pj4+Pj4+IMKgwqDCoCAqIEBkZXY6IGRybV9kZXZpY2UgdG8gaW1wb3J0IGludG8N
Cj4+Pj4+Pj4gwqDCoMKgICogQGRtYV9idWY6IGRtYS1idWYgb2JqZWN0IHRvIGltcG9ydA0K
Pj4+Pj4+PiDCoMKgwqAgKg0KPj4+Pj4+PiAtICogVGhpcyBpcyB0aGUgaW1wbGVtZW50YXRp
b24gb2YgdGhlIGdlbV9wcmltZV9pbXBvcnQgZnVuY3Rpb25zDQo+Pj4+Pj4+IGZvciBHRU0N
Cj4+Pj4+Pj4gLSAqIGRyaXZlcnMgdXNpbmcgdGhlIFBSSU1FIGhlbHBlcnMuIEl0IGlzIHRo
ZSBkZWZhdWx0IGZvciBkcml2ZXJzDQo+Pj4+Pj4+IHRoYXQgZG8NCj4+Pj4+Pj4gLSAqIG5v
dCBzZXQgdGhlaXIgb3duICZkcm1fZHJpdmVyLmdlbV9wcmltZV9pbXBvcnQuDQo+Pj4+Pj4+
ICsgKiBUaGlzIGlzIHRoZSBpbXBsZW1lbnRhdGlvbiBvZiB0aGUgZ2VtX3ByaW1lX2ltcG9y
dCBmdW5jdGlvbnMNCj4+Pj4+Pj4gZm9yIEdFTSBkcml2ZXJzDQo+Pj4+Pj4+ICsgKiB1c2lu
ZyB0aGUgUFJJTUUgaGVscGVycy4gRHJpdmVycyBjYW4gdXNlIHRoaXMgYXMgdGhlaXINCj4+
Pj4+Pj4gKyAqICZkcm1fZHJpdmVyLmdlbV9wcmltZV9pbXBvcnQgaW1wbGVtZW50YXRpb24u
IEl0IGlzIHVzZWQgYXMgdGhlDQo+Pj4+Pj4+IGRlZmF1bHQNCj4+Pj4+Pj4gKyAqIGltcGxl
bWVudGF0aW9uIGluIGRybV9nZW1fcHJpbWVfZmRfdG9faGFuZGxlKCkuDQo+Pj4+Pj4+IMKg
wqDCoCAqDQo+Pj4+Pj4+IMKgwqDCoCAqIERyaXZlcnMgbXVzdCBhcnJhbmdlIHRvIGNhbGwg
ZHJtX3ByaW1lX2dlbV9kZXN0cm95KCkgZnJvbSANCj4+Pj4+Pj4gdGhlaXINCj4+Pj4+Pj4g
wqDCoMKgICogJmRybV9nZW1fb2JqZWN0X2Z1bmNzLmZyZWUgaG9vayB3aGVuIHVzaW5nIHRo
aXMgZnVuY3Rpb24uDQo+Pj4+Pj4+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS9kcm1fcHJp
bWUuaCBiL2luY2x1ZGUvZHJtL2RybV9wcmltZS5oDQo+Pj4+Pj4+IGluZGV4IGE3YWJmOWYz
ZTY5Ny4uMmExZDAxZTViNTZiIDEwMDY0NA0KPj4+Pj4+PiAtLS0gYS9pbmNsdWRlL2RybS9k
cm1fcHJpbWUuaA0KPj4+Pj4+PiArKysgYi9pbmNsdWRlL2RybS9kcm1fcHJpbWUuaA0KPj4+
Pj4+PiBAQCAtNjAsMTIgKzYwLDE5IEBAIGVudW0gZG1hX2RhdGFfZGlyZWN0aW9uOw0KPj4+
Pj4+PiDCoMKgIMKgIHN0cnVjdCBkcm1fZGV2aWNlOw0KPj4+Pj4+PiDCoMKgIHN0cnVjdCBk
cm1fZ2VtX29iamVjdDsNCj4+Pj4+Pj4gK3N0cnVjdCBkcm1fZmlsZTsNCj4+Pj4+Pj4gwqDC
oCDCoCAvKiBjb3JlIHByaW1lIGZ1bmN0aW9ucyAqLw0KPj4+Pj4+PiDCoMKgIHN0cnVjdCBk
bWFfYnVmICpkcm1fZ2VtX2RtYWJ1Zl9leHBvcnQoc3RydWN0IGRybV9kZXZpY2UgKmRldiwN
Cj4+Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIHN0cnVjdCBkbWFfYnVmX2V4cG9ydF9pbmZvICpleHBfaW5mbyk7DQo+Pj4+Pj4+IMKg
wqAgdm9pZCBkcm1fZ2VtX2RtYWJ1Zl9yZWxlYXNlKHN0cnVjdCBkbWFfYnVmICpkbWFfYnVm
KTsNCj4+Pj4+Pj4gwqDCoCAraW50IGRybV9nZW1fcHJpbWVfZmRfdG9faGFuZGxlKHN0cnVj
dCBkcm1fZGV2aWNlICpkZXYsDQo+Pj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgc3RydWN0IGRybV9maWxlICpmaWxlX3ByaXYsIGludCBwcmltZV9mZCwN
Cj4+Pj4+Pj4gdWludDMyX3QgKmhhbmRsZSk7DQo+Pj4+Pj4+ICtpbnQgZHJtX2dlbV9wcmlt
ZV9oYW5kbGVfdG9fZmQoc3RydWN0IGRybV9kZXZpY2UgKmRldiwNCj4+Pj4+Pj4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzdHJ1Y3QgZHJtX2ZpbGUgKmZpbGVf
cHJpdiwgdWludDMyX3QgaGFuZGxlLA0KPj4+Pj4+PiB1aW50MzJfdCBmbGFncywNCj4+Pj4+
Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpbnQgKnByaW1lX2Zk
KTsNCj4+Pj4+Pj4gKw0KPj4+Pj4+PiDCoMKgIC8qIGhlbHBlciBmdW5jdGlvbnMgZm9yIGV4
cG9ydGluZyAqLw0KPj4+Pj4+PiDCoMKgIGludCBkcm1fZ2VtX21hcF9hdHRhY2goc3RydWN0
IGRtYV9idWYgKmRtYV9idWYsDQo+Pj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgc3RydWN0IGRtYV9idWZfYXR0YWNobWVudCAqYXR0YWNoKTsNCg0KLS0gDQpU
aG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0
d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpGcmFua2Vuc3RyYXNzZSAxNDYsIDkwNDYx
IE51ZXJuYmVyZywgR2VybWFueQ0KR0Y6IEl2byBUb3RldiwgQW5kcmV3IE15ZXJzLCBBbmRy
ZXcgTWNEb25hbGQsIEJvdWRpZW4gTW9lcm1hbg0KSFJCIDM2ODA5IChBRyBOdWVybmJlcmcp
DQo=

--------------zbKvkIQxIFinRff0gbAELO5s--

--------------bdeiKJuODE1jKqhIk6S3YeEF
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmVbiDQFAwAAAAAACgkQlh/E3EQov+Aj
IhAAxQIl1G8X3XJCARJfxKUMKBdWpRmxAizWqVpo4UgEO4fKL2rDt/12054nEkUoFaGoSoSH40Oa
FWfQvCGm0o+4ikABKTAuggBIGziJ3u2vX/cKZTADjmQC9zr+vJAyWdUKNVu5+SJDuR7qatBfDGGz
Mia1moWlQkEjC4sFAX25ay3l1lizCjCEMekR1Z5csaTXcBO/NATXWs2BlH4isHnCdNqMorq054du
zyxaNr5PcEBwbjgvcpQP30ph5L502x/QkSzVoNV3hV1YeyQQ2ZfgLZzqAdqyVZncWlgrjlEVAJcZ
SO/i2r+VwpcH2NALGFWWDXYVRURnn+J92UmqpRgPq4hE4DZJjdcYrnDaTiym/o+h/VKcTZ1nVh+v
tVbjkRqFIBmbh6XDxulIq1b5OUi39jJcE8pWQE6aT+0DTGImtaJdX8joPa2qg0CEjhIKWUmQWwok
TXF6QkGZrBp63wY9iHNoua1qRlGBGMxHWdvkXx22vOvx7FVggjCF6xrt+3t42jrjklwgmfXg9U0h
7j4581DER17AFQPvGKEUW2Go+S/6ATUXHkCEZ0z3iyKoiWCb5NxGka0wJtdobU7hFrMOjUDPQG0Q
i1O0Uj7XzLReOWSVS+wlJ5NLxXycSwPHftZnR0JETA1OMhrij/8rb8a7ETE2gP/i7Cg9uSDHEO6s
3JE=
=Cs2m
-----END PGP SIGNATURE-----

--------------bdeiKJuODE1jKqhIk6S3YeEF--
