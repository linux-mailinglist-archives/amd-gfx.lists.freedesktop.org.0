Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFD169854EA
	for <lists+amd-gfx@lfdr.de>; Wed, 25 Sep 2024 10:02:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16A5410E7C5;
	Wed, 25 Sep 2024 08:02:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="loBpt9Tt";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="V/wUClqF";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="loBpt9Tt";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="V/wUClqF";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D8F110E7BA;
 Wed, 25 Sep 2024 08:02:22 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id D9A4B1FD32;
 Wed, 25 Sep 2024 08:02:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1727251340; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=g922HbZAMT/CQPXMHds4mltwe6sYDaXrkidRjdOYm6s=;
 b=loBpt9Ttb7xBQU6oMAUdSw36x/fCnRqgqosgZYsyC5uwn4rMpZ2rORASOzfZwFzNeTLnRE
 EaRH0oEHogp7yyYk2luyx85qaoMVBKE+kcLHzuY8LQp3Cab9QyOIWIJfep9wR0Cc6WLt+N
 nrjouX5AozQw7NGOCbSaesYP/XOOalU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1727251340;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=g922HbZAMT/CQPXMHds4mltwe6sYDaXrkidRjdOYm6s=;
 b=V/wUClqF8RmWhNNEpHFdLOeL4RA/ky86SH26t42uaZmL8ZuNK1Exjd8mm7f7P+G3Px37P/
 4n+Zcds7UglyZRAg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1727251340; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=g922HbZAMT/CQPXMHds4mltwe6sYDaXrkidRjdOYm6s=;
 b=loBpt9Ttb7xBQU6oMAUdSw36x/fCnRqgqosgZYsyC5uwn4rMpZ2rORASOzfZwFzNeTLnRE
 EaRH0oEHogp7yyYk2luyx85qaoMVBKE+kcLHzuY8LQp3Cab9QyOIWIJfep9wR0Cc6WLt+N
 nrjouX5AozQw7NGOCbSaesYP/XOOalU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1727251340;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=g922HbZAMT/CQPXMHds4mltwe6sYDaXrkidRjdOYm6s=;
 b=V/wUClqF8RmWhNNEpHFdLOeL4RA/ky86SH26t42uaZmL8ZuNK1Exjd8mm7f7P+G3Px37P/
 4n+Zcds7UglyZRAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 826E913A6A;
 Wed, 25 Sep 2024 08:02:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 7hhIHozD82bteAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 25 Sep 2024 08:02:20 +0000
Message-ID: <d95eca6e-0266-4ebe-b9d9-3e8552c5b09a@suse.de>
Date: Wed, 25 Sep 2024 10:02:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: NULL pointer dereference after ib test on ring 7 succeeded
To: Arthur Marsh <arthur.marsh@internode.on.net>, alexdeucher@gmail.com
Cc: Xinhui.Pan@amd.com, airlied@gmail.com, alexander.deucher@amd.com,
 amd-gfx@lists.freedesktop.org, christian.koenig@amd.com, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, iommu@lists.linux.dev,
 linux-kernel@vger.kernel.org, wuhoipok@gmail.com, x86@kernel.org
References: <CADnq5_OtdUvOUPpq1aUoxtgpt6a4h598019SNhe+9ZWUaANYqg@mail.gmail.com>
 <20240925002205.4065-1-user@am64>
Content-Language: en-US
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
In-Reply-To: <20240925002205.4065-1-user@am64>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-Spam-Level: 
X-Spamd-Result: default: False [-3.20 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MIME_BASE64_TEXT_BOGUS(1.00)[]; NEURAL_HAM_LONG(-1.00)[-0.998];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_BASE64_TEXT(0.10)[];
 MIME_GOOD(-0.10)[text/plain]; RCVD_TLS_ALL(0.00)[];
 ARC_NA(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 FREEMAIL_TO(0.00)[internode.on.net,gmail.com];
 RCPT_COUNT_TWELVE(0.00)[13]; MIME_TRACE(0.00)[0:+];
 MID_RHS_MATCH_FROM(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com,internode.on.net];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_HAS_DN(0.00)[];
 FREEMAIL_CC(0.00)[amd.com,gmail.com,lists.freedesktop.org,ffwll.ch,lists.linux.dev,vger.kernel.org,kernel.org];
 TO_DN_SOME(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Score: -3.20
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

SGkNCg0KQW0gMjUuMDkuMjQgdW0gMDI6MjIgc2NocmllYiBBcnRodXIgTWFyc2g6DQo+IEFm
dGVyIHJlYnVpbGRpbmcgY3VycmVudCBMaW51cyBnaXQgaGVhZCB3aXRoOg0KPg0KPiBkbWEt
bWFwcGluZzogcmVwb3J0IHVubGltaXRlZCBETUEgYWRkcmVzc2luZyBpbiBJT01NVSBETUEg
cGF0aA0KPiBiMzQ4YjZkMTdmZDFkNWQ4OWI4NmRiNjAyZjAyYmVhNTRhNzU0YmQ4DQoNCkkg
Y2Fubm90IHlldCBhcHBseSB0aGlzIHBhdGNoIGxvY2FsbHkgYXMgYSBmdW5jdGlvbiBpcyBt
aXNzaW5nLiBJJ2xsIA0Kd2FpdCBmb3IgLXJjMSB0byBkbyBmdXJ0aGVyIGRlYnVnZ2luZy4N
Cg0KQmVzdCByZWdhcmRzDQpUaG9tYXMNCg0KPg0KPiBhcHBsaWVkLCB0aGUgcmFkZW9uIG1v
ZHVsZSBsb2FkIGdldHMgZnVydGhlciBiZWZvcmUgaGl0dGluZyBhbm90aGVyDQo+IE5VTEwg
cG9pbnRlciBkZXJlZmVyZW5jZToNCj4NCj4gWyAgIDE3Ljc3NzQ3Ml0gW2RybV0gcmFkZW9u
IGtlcm5lbCBtb2Rlc2V0dGluZyBlbmFibGVkLg0KPiBbICAgMTcuNzc3NTM2XSByYWRlb24g
MDAwMDowMDowMS4wOiB2Z2FhcmI6IGRlYWN0aXZhdGUgdmdhIGNvbnNvbGUNCj4gWyAgIDE3
Ljc3ODI3Nl0gQ29uc29sZTogc3dpdGNoaW5nIHRvIGNvbG91ciBkdW1teSBkZXZpY2UgODB4
MjUNCj4gWyAgIDE3Ljc3ODUxOV0gW2RybV0gaW5pdGlhbGl6aW5nIGtlcm5lbCBtb2Rlc2V0
dGluZyAoQVJVQkEgMHgxMDAyOjB4OTkwQyAweDEwMDI6MHgwMTIzIDB4MDApLg0KPiBbICAg
MTcuNzc4NjAwXSBBVE9NIEJJT1M6IDExMw0KPiBbICAgMTcuNzc4NjU4XSByYWRlb24gMDAw
MDowMDowMS4wOiBWUkFNOiA3NjhNIDB4MDAwMDAwMDAwMDAwMDAwMCAtIDB4MDAwMDAwMDAy
RkZGRkZGRiAoNzY4TSB1c2VkKQ0KPiBbICAgMTcuNzc4NjYxXSByYWRlb24gMDAwMDowMDow
MS4wOiBHVFQ6IDEwMjRNIDB4MDAwMDAwMDAzMDAwMDAwMCAtIDB4MDAwMDAwMDA2RkZGRkZG
Rg0KPiBbICAgMTcuNzc4NjY1XSBbZHJtXSBEZXRlY3RlZCBWUkFNIFJBTT03NjhNLCBCQVI9
MjU2TQ0KPiBbICAgMTcuNzc4NjY1XSBbZHJtXSBSQU0gd2lkdGggNjRiaXRzIEREUg0KPiBb
ICAgMTcuNzc4NzY0XSBbZHJtXSByYWRlb246IDc2OE0gb2YgVlJBTSBtZW1vcnkgcmVhZHkN
Cj4gWyAgIDE3Ljc3ODc2Nl0gW2RybV0gcmFkZW9uOiAxMDI0TSBvZiBHVFQgbWVtb3J5IHJl
YWR5Lg0KPiBbICAgMTcuNzc4Nzc3XSBbZHJtXSBMb2FkaW5nIEFSVUJBIE1pY3JvY29kZQ0K
PiBbICAgMTguMDM4MDg0XSBbZHJtXSBJbnRlcm5hbCB0aGVybWFsIGNvbnRyb2xsZXIgd2l0
aG91dCBmYW4gY29udHJvbA0KPiBbICAgMTguMDM4NDI1XSBbZHJtXSByYWRlb246IGRwbSBp
bml0aWFsaXplZA0KPiBbICAgMTguMzMzNTA4XSBbZHJtXSBGb3VuZCBWQ0UgZmlybXdhcmUv
ZmVlZGJhY2sgdmVyc2lvbiA1MC4wLjEgLyAxNyENCj4gWyAgIDE4LjMzMzU0OF0gW2RybV0g
R0FSVDogbnVtIGNwdSBwYWdlcyAyNjIxNDQsIG51bSBncHUgcGFnZXMgMjYyMTQ0DQo+IFsg
ICAxOC4zNTM2MjRdIFtkcm1dIFBDSUUgR0FSVCBvZiAxMDI0TSBlbmFibGVkICh0YWJsZSBh
dCAweDAwMDAwMDAwMDAxRDYwMDApLg0KPiBbICAgMTguMzUzNzU1XSByYWRlb24gMDAwMDow
MDowMS4wOiBXQiBlbmFibGVkDQo+IFsgICAxOC4zNTM3NThdIHJhZGVvbiAwMDAwOjAwOjAx
LjA6IGZlbmNlIGRyaXZlciBvbiByaW5nIDAgdXNlIGdwdSBhZGRyIDB4MDAwMDAwMDAzMDAw
MGMwMA0KPiBbICAgMTguMzU0MTM2XSByYWRlb24gMDAwMDowMDowMS4wOiBmZW5jZSBkcml2
ZXIgb24gcmluZyA1IHVzZSBncHUgYWRkciAweDAwMDAwMDAwMDAwNzVhMTgNCj4gWyAgIDE4
LjM3NDIwNl0gcmFkZW9uIDAwMDA6MDA6MDEuMDogZmVuY2UgZHJpdmVyIG9uIHJpbmcgNiB1
c2UgZ3B1IGFkZHIgMHgwMDAwMDAwMDMwMDAwYzE4DQo+IFsgICAxOC4zNzQyMDhdIHJhZGVv
biAwMDAwOjAwOjAxLjA6IGZlbmNlIGRyaXZlciBvbiByaW5nIDcgdXNlIGdwdSBhZGRyIDB4
MDAwMDAwMDAzMDAwMGMxYw0KPiBbICAgMTguMzc0MjEwXSByYWRlb24gMDAwMDowMDowMS4w
OiBmZW5jZSBkcml2ZXIgb24gcmluZyAxIHVzZSBncHUgYWRkciAweDAwMDAwMDAwMzAwMDBj
MDQNCj4gWyAgIDE4LjM3NDIxMl0gcmFkZW9uIDAwMDA6MDA6MDEuMDogZmVuY2UgZHJpdmVy
IG9uIHJpbmcgMiB1c2UgZ3B1IGFkZHIgMHgwMDAwMDAwMDMwMDAwYzA4DQo+IFsgICAxOC4z
NzQyMTNdIHJhZGVvbiAwMDAwOjAwOjAxLjA6IGZlbmNlIGRyaXZlciBvbiByaW5nIDMgdXNl
IGdwdSBhZGRyIDB4MDAwMDAwMDAzMDAwMGMwYw0KPiBbICAgMTguMzc0MjE0XSByYWRlb24g
MDAwMDowMDowMS4wOiBmZW5jZSBkcml2ZXIgb24gcmluZyA0IHVzZSBncHUgYWRkciAweDAw
MDAwMDAwMzAwMDBjMTANCj4gWyAgIDE4LjM3NDQ2OV0gcmFkZW9uIDAwMDA6MDA6MDEuMDog
cmFkZW9uOiBNU0kgbGltaXRlZCB0byAzMi1iaXQNCj4gWyAgIDE4LjM3NDUyNV0gcmFkZW9u
IDAwMDA6MDA6MDEuMDogcmFkZW9uOiB1c2luZyBNU0kuDQo+IFsgICAxOC4zNzQ2MDRdIFtk
cm1dIHJhZGVvbjogaXJxIGluaXRpYWxpemVkLg0KPiBbICAgMTguMzkyODIzXSBbZHJtXSBy
aW5nIHRlc3Qgb24gMCBzdWNjZWVkZWQgaW4gMyB1c2Vjcw0KPiBbICAgMTguMzkyODMxXSBb
ZHJtXSByaW5nIHRlc3Qgb24gMyBzdWNjZWVkZWQgaW4gNCB1c2Vjcw0KPiBbICAgMTguMzky
ODM2XSBbZHJtXSByaW5nIHRlc3Qgb24gNCBzdWNjZWVkZWQgaW4gMyB1c2Vjcw0KPiBbICAg
MTguNDM4NTI2XSBbZHJtXSByaW5nIHRlc3Qgb24gNSBzdWNjZWVkZWQgaW4gMiB1c2Vjcw0K
PiBbICAgMTguNDU4MzgwXSBbZHJtXSBVVkQgaW5pdGlhbGl6ZWQgc3VjY2Vzc2Z1bGx5Lg0K
PiBbICAgMTguNTY3NjE2XSBbZHJtXSByaW5nIHRlc3Qgb24gNiBzdWNjZWVkZWQgaW4gMTgg
dXNlY3MNCj4gWyAgIDE4LjU2NzYyNl0gW2RybV0gcmluZyB0ZXN0IG9uIDcgc3VjY2VlZGVk
IGluIDMgdXNlY3MNCj4gWyAgIDE4LjU2NzYyN10gW2RybV0gVkNFIGluaXRpYWxpemVkIHN1
Y2Nlc3NmdWxseS4NCj4gWyAgIDE4LjU2NzY4Nl0gc25kX2hkYV9pbnRlbCAwMDAwOjAwOjAx
LjE6IGJvdW5kIDAwMDA6MDA6MDEuMCAob3BzIHJhZGVvbl9hdWRpb19jb21wb25lbnRfYmlu
ZF9vcHMgW3JhZGVvbl0pDQo+IFsgICAxOC41Njc5MjVdIFtkcm1dIGliIHRlc3Qgb24gcmlu
ZyAwIHN1Y2NlZWRlZCBpbiAwIHVzZWNzDQo+IFsgICAxOC41Njc5NjhdIFtkcm1dIGliIHRl
c3Qgb24gcmluZyAzIHN1Y2NlZWRlZCBpbiAwIHVzZWNzDQo+IFsgICAxOC41NjgwMDhdIFtk
cm1dIGliIHRlc3Qgb24gcmluZyA0IHN1Y2NlZWRlZCBpbiAwIHVzZWNzDQo+IFsgICAxOS4w
OTQ1MjddIFtkcm1dIGliIHRlc3Qgb24gcmluZyA1IHN1Y2NlZWRlZA0KPiBbICAgMTkuMjU3
NzEzXSBtYzogTGludXggbWVkaWEgaW50ZXJmYWNlOiB2MC4xMA0KPiBbICAgMTkuNjM4MjM1
XSBbZHJtXSBpYiB0ZXN0IG9uIHJpbmcgNiBzdWNjZWVkZWQNCj4gWyAgIDIwLjAxNzA2OV0g
dXNiIDEtMzogZHZiX3VzYl92MjogZm91bmQgYSAnUmVhbHRlayBSVEwyODMyVSByZWZlcmVu
Y2UgZGVzaWduJyBpbiB3YXJtIHN0YXRlDQo+IFsgICAyMC4wNDg0NzNdIHVzYiAxLTM6IGR2
Yl91c2JfdjI6IHdpbGwgcGFzcyB0aGUgY29tcGxldGUgTVBFRzIgdHJhbnNwb3J0IHN0cmVh
bSB0byB0aGUgc29mdHdhcmUgZGVtdXhlcg0KPiBbICAgMjAuMDQ4NDkzXSBkdmJkZXY6IERW
QjogcmVnaXN0ZXJpbmcgbmV3IGFkYXB0ZXIgKFJlYWx0ZWsgUlRMMjgzMlUgcmVmZXJlbmNl
IGRlc2lnbikNCj4gWyAgIDIwLjA0ODQ5N10gdXNiIDEtMzogbWVkaWEgY29udHJvbGxlciBj
cmVhdGVkDQo+IFsgICAyMC4wNDk0ODddIGR2YmRldjogZHZiX2NyZWF0ZV9tZWRpYV9lbnRp
dHk6IG1lZGlhIGVudGl0eSAnZHZiLWRlbXV4JyByZWdpc3RlcmVkLg0KPiBbICAgMjAuMTUw
MzYxXSBbZHJtXSBpYiB0ZXN0IG9uIHJpbmcgNyBzdWNjZWVkZWQNCj4gWyAgIDIwLjE1MDcw
MF0gQlVHOiBrZXJuZWwgTlVMTCBwb2ludGVyIGRlcmVmZXJlbmNlLCBhZGRyZXNzOiAwMDAw
MDAwMDAwMDAwMDUwDQo+IFsgICAyMC4xNTA3MDJdICNQRjogc3VwZXJ2aXNvciByZWFkIGFj
Y2VzcyBpbiBrZXJuZWwgbW9kZQ0KPiBbICAgMjAuMTUwNzA0XSAjUEY6IGVycm9yX2NvZGUo
MHgwMDAwKSAtIG5vdC1wcmVzZW50IHBhZ2UNCj4gWyAgIDIwLjE1MDcwNV0gUEdEIDAgUDRE
IDANCj4gWyAgIDIwLjE1MDcwN10gT29wczogT29wczogMDAwMCBbIzFdIFBSRUVNUFRfUlQg
U01QIE5PUFRJDQo+IFsgICAyMC4xNTA3MTBdIENQVTogMCBVSUQ6IDAgUElEOiA0NDYgQ29t
bTogdWRldmQgTm90IHRhaW50ZWQgNi4xMS4wKyAjNjEyMg0KPiBbICAgMjAuMTUwNzEzXSBI
YXJkd2FyZSBuYW1lOiBHaWdhYnl0ZSBUZWNobm9sb2d5IENvLiwgTHRkLiBUbyBiZSBmaWxs
ZWQgYnkgTy5FLk0uL0YyQTc4TS1IRDIsIEJJT1MgRjIgMDUvMjgvMjAxNA0KPiBbICAgMjAu
MTUwNzE0XSBSSVA6IDAwMTA6ZHJtX2RwX2F1eF9yZWdpc3RlcisweDU5LzB4MTEwIFtkcm1f
ZGlzcGxheV9oZWxwZXJdDQo+IFsgICAyMC4xNTA3MzJdIENvZGU6IGExIGMwIDQ4IDg1IGY2
IDQ4IDg5IDgzIGI4IDAwIDAwIDAwIDc0IDFjIDQ4IDhkIGJiIGI0IDAzIDAwIDAwIGJhIDMw
IDAwIDAwIDAwIGU4IDUyIGU1IDYwIGRiIDQ4IDhkIDdiIDA4IDViIDVkIGU5IGI3IGVhIDM3
IGRiIDw0OD4gOGIgNzAgNTAgNDggODUgZjYgNzUgZGIgNDggOGIgMzAgZWIgZDYgNDggOGQg
YWIgODggMDQgMDAgMDAgNDgNCj4gWyAgIDIwLjE1MDczNF0gUlNQOiAwMDE4OmZmZmY5ZWI4
MDEzY2I5NjAgRUZMQUdTOiAwMDAxMDI0Ng0KPiBbICAgMjAuMTUwNzM2XSBSQVg6IDAwMDAw
MDAwMDAwMDAwMDAgUkJYOiBmZmZmOGYxOTgzYmZjNTA4IFJDWDogZmZmZmZmZmZjMGJkMWJj
MA0KPiBbICAgMjAuMTUwNzM3XSBSRFg6IGZmZmZmZmZmYzBhMWRlNDAgUlNJOiAwMDAwMDAw
MDAwMDAwMDAwIFJESTogZmZmZjhmMTk4M2JmYzlmMA0KPiBbICAgMjAuMTUwNzM4XSBSQlA6
IGZmZmY4ZjE5ODNiZmM5ZjAgUjA4OiBmZmZmOGYxOTljYTcwMDA4IFIwOTogMDAwMDAwMDBj
MGMwYzBjMA0KPiBbICAgMjAuMTUwNzM5XSBSMTA6IDAwMDAwMDAwMDAwMDAwMDAgUjExOiAw
MDAwMDAwMDAwMDAwMDAxIFIxMjogZmZmZjhmMTk5ZGE5YWY1MA0KPiBbICAgMjAuMTUwNzQw
XSBSMTM6IGZmZmY4ZjE5OWRhOWIwOTIgUjE0OiBmZmZmOGYxOTlkYTlhZjJlIFIxNTogMDAw
MDAwMDAwMDAwMDAxOA0KPiBbICAgMjAuMTUwNzQxXSBGUzogIDAwMDA3ZmY5YjllNmE4NDAo
MDAwMCkgR1M6ZmZmZjhmMWNhZjgwMDAwMCgwMDAwKSBrbmxHUzowMDAwMDAwMDAwMDAwMDAw
DQo+IFsgICAyMC4xNTA3NDNdIENTOiAgMDAxMCBEUzogMDAwMCBFUzogMDAwMCBDUjA6IDAw
MDAwMDAwODAwNTAwMzMNCj4gWyAgIDIwLjE1MDc0NF0gQ1IyOiAwMDAwMDAwMDAwMDAwMDUw
IENSMzogMDAwMDAwMDEwMzNlNDAwMCBDUjQ6IDAwMDAwMDAwMDAwNDA2ZjANCj4gWyAgIDIw
LjE1MDc0NV0gQ2FsbCBUcmFjZToNCj4gWyAgIDIwLjE1MDc0N10gIDxUQVNLPg0KPiBbICAg
MjAuMTUwNzQ4XSAgPyBfX2RpZV9ib2R5LmNvbGQrMHgxOS8weDFlDQo+IFsgICAyMC4xNTA3
NTNdICA/IHBhZ2VfZmF1bHRfb29wcysweGE4LzB4MjMwDQo+IFsgICAyMC4xNTA3NTddICA/
IGRybV9kcF9hdXhfcmVnaXN0ZXIrMHg1OS8weDExMCBbZHJtX2Rpc3BsYXlfaGVscGVyXQ0K
PiBbICAgMjAuMTUwNzY3XSAgPyBzZWFyY2hfbW9kdWxlX2V4dGFibGVzKzB4NGYvMHg5MA0K
PiBbICAgMjAuMTUwNzcxXSAgPyBmaXh1cF9leGNlcHRpb24rMHgzNi8weDJmMA0KPiBbICAg
MjAuMTUwNzczXSAgPyBleGNfcGFnZV9mYXVsdCsweDg4LzB4MWIwDQo+IFsgICAyMC4xNTA3
NzZdICA/IGFzbV9leGNfcGFnZV9mYXVsdCsweDIyLzB4MzANCj4gWyAgIDIwLjE1MDc3OV0g
ID8gX19wZnhfcmFkZW9uX2RwX2F1eF90cmFuc2Zlcl9hdG9tKzB4MTAvMHgxMCBbcmFkZW9u
XQ0KPiBbICAgMjAuMTUwODg4XSAgPyBkcm1fZHBfYXV4X3JlZ2lzdGVyKzB4NTkvMHgxMTAg
W2RybV9kaXNwbGF5X2hlbHBlcl0NCj4gWyAgIDIwLjE1MDkwMF0gIHJhZGVvbl9kcF9hdXhf
aW5pdCsweDkxLzB4YzAgW3JhZGVvbl0NCj4gWyAgIDIwLjE1MDk4NF0gIHJhZGVvbl9nZXRf
YXRvbV9jb25uZWN0b3JfaW5mb19mcm9tX29iamVjdF90YWJsZSsweDU4ZS8weDg4MCBbcmFk
ZW9uXQ0KPiBbICAgMjAuMTUxMDQ3XSAgPyByYWRlb25fZ2V0X2F0b21fY29ubmVjdG9yX2lu
Zm9fZnJvbV9zdXBwb3J0ZWRfZGV2aWNlc190YWJsZSsweDVjZi8weDYwMCBbcmFkZW9uXQ0K
PiBbICAgMjAuMTUxMTExXSAgPyBrc3RyZHVwKzB4NGMvMHg3MA0KPiBbICAgMjAuMTUxMTE1
XSAgPyBfX2ttYWxsb2Nfbm9wcm9mKzB4MjRkLzB4MzQwDQo+IFsgICAyMC4xNTExMThdICBy
YWRlb25fbW9kZXNldF9pbml0KzB4Mzc1LzB4NDcwIFtyYWRlb25dDQo+IFsgICAyMC4xNTEx
ODddICA/IHJhZGVvbl9kZXZpY2VfaW5pdCsweDY2Ny8weGI0MCBbcmFkZW9uXQ0KPiBbICAg
MjAuMTUxMjUwXSAgcmFkZW9uX2RyaXZlcl9sb2FkX2ttcysweGMyLzB4MjYwIFtyYWRlb25d
DQo+IFsgICAyMC4xNTEzMTJdICByYWRlb25fcGNpX3Byb2JlKzB4ZmYvMHgxNzAgW3JhZGVv
bl0NCj4gWyAgIDIwLjE1MTM3NF0gIHBjaV9kZXZpY2VfcHJvYmUrMHhiZS8weDFhMA0KPiBb
ICAgMjAuMTUxMzc3XSAgcmVhbGx5X3Byb2JlKzB4ZGUvMHgzNTANCj4gWyAgIDIwLjE1MTM4
MF0gID8gcG1fcnVudGltZV9iYXJyaWVyKzB4NjEvMHhiMA0KPiBbICAgMjAuMTUxMzgzXSAg
PyBfX3BmeF9fX2RyaXZlcl9hdHRhY2grMHgxMC8weDEwDQo+IFsgICAyMC4xNTEzODZdICBf
X2RyaXZlcl9wcm9iZV9kZXZpY2UrMHg3OC8weDExMA0KPiBbICAgMjAuMTUxMzg4XSAgZHJp
dmVyX3Byb2JlX2RldmljZSsweDJkLzB4YzANCj4gWyAgIDIwLjE1MTM5MF0gIF9fZHJpdmVy
X2F0dGFjaCsweGM5LzB4MWMwDQo+IFsgICAyMC4xNTEzOTNdICBidXNfZm9yX2VhY2hfZGV2
KzB4NmEvMHhiMA0KPiBbICAgMjAuMTUxMzk1XSAgPyBtaWdyYXRlX2VuYWJsZSsweGJmLzB4
ZjANCj4gWyAgIDIwLjE1MTM5N10gIGJ1c19hZGRfZHJpdmVyKzB4MTM5LzB4MjIwDQo+IFsg
ICAyMC4xNTE0MDBdICBkcml2ZXJfcmVnaXN0ZXIrMHg2ZS8weGMwDQo+IFsgICAyMC4xNTE0
MDJdICA/IF9fcGZ4X3JhZGVvbl9tb2R1bGVfaW5pdCsweDEwLzB4MTAgW3JhZGVvbl0NCj4g
WyAgIDIwLjE1MTQ2M10gIGRvX29uZV9pbml0Y2FsbCsweDQyLzB4MjEwDQo+IFsgICAyMC4x
NTE0NjddICA/IF9fa21hbGxvY19jYWNoZV9ub3Byb2YrMHg4OS8weDIzMA0KPiBbICAgMjAu
MTUxNDY5XSAgZG9faW5pdF9tb2R1bGUrMHg2MC8weDIxMA0KPiBbICAgMjAuMTUxNDcyXSAg
aW5pdF9tb2R1bGVfZnJvbV9maWxlKzB4ODkvMHhjMA0KPiBbICAgMjAuMTUxNDc1XSAgX194
NjRfc3lzX2Zpbml0X21vZHVsZSsweDE0Mi8weDM5MA0KPiBbICAgMjAuMTUxNDc3XSAgZG9f
c3lzY2FsbF82NCsweDQ3LzB4MTEwDQo+IFsgICAyMC4xNTE0ODBdICBlbnRyeV9TWVNDQUxM
XzY0X2FmdGVyX2h3ZnJhbWUrMHg3Ni8weDdlDQo+IFsgICAyMC4xNTE0ODNdIFJJUDogMDAz
MzoweDdmZjliOWQ4MjI3OQ0KPiBbICAgMjAuMTUxNDg1XSBDb2RlOiBmZiBjMyA2NiAyZSAw
ZiAxZiA4NCAwMCAwMCAwMCAwMCAwMCAwZiAxZiA0NCAwMCAwMCA0OCA4OSBmOCA0OCA4OSBm
NyA0OCA4OSBkNiA0OCA4OSBjYSA0ZCA4OSBjMiA0ZCA4OSBjOCA0YyA4YiA0YyAyNCAwOCAw
ZiAwNSA8NDg+IDNkIDAxIGYwIGZmIGZmIDczIDAxIGMzIDQ4IDhiIDBkIDc3IDZiIDBkIDAw
IGY3IGQ4IDY0IDg5IDAxIDQ4DQo+IFsgICAyMC4xNTE0ODZdIFJTUDogMDAyYjowMDAwN2Zm
ZmM1Zjg0NzA4IEVGTEFHUzogMDAwMDAyNDYgT1JJR19SQVg6IDAwMDAwMDAwMDAwMDAxMzkN
Cj4gWyAgIDIwLjE1MTQ4OF0gUkFYOiBmZmZmZmZmZmZmZmZmZmRhIFJCWDogMDAwMDU1ZDAy
MDY4ZDliMCBSQ1g6IDAwMDA3ZmY5YjlkODIyNzkNCj4gWyAgIDIwLjE1MTQ4OV0gUkRYOiAw
MDAwMDAwMDAwMDAwMDAwIFJTSTogMDAwMDU1ZDAyMDY4MDdmMCBSREk6IDAwMDAwMDAwMDAw
MDAwMTINCj4gWyAgIDIwLjE1MTQ5MF0gUkJQOiAwMDAwMDAwMDAwMDAwMDAwIFIwODogMDAw
MDAwMDAwMDAwMDAwMSBSMDk6IDAwMDA1NWQwMjA2NmQ1NDANCj4gWyAgIDIwLjE1MTQ5MV0g
UjEwOiAwMDAwMDAwMDAwMDAwMDQwIFIxMTogMDAwMDAwMDAwMDAwMDI0NiBSMTI6IDAwMDA1
NWQwMjA2ODA3ZjANCj4gWyAgIDIwLjE1MTQ5Ml0gUjEzOiAwMDAwMDAwMDAwMDIwMDAwIFIx
NDogMDAwMDU1ZDAyMDY3ZTUxMCBSMTU6IDAwMDAwMDAwMDAwMDAwMDANCj4gWyAgIDIwLjE1
MTQ5NF0gIDwvVEFTSz4NCj4gWyAgIDIwLjE1MTQ5NF0gTW9kdWxlcyBsaW5rZWQgaW46IGky
Y19tdXggZHZiX3VzYl9ydGwyOHh4dSgrKSBkdmJfdXNiX3YyIGR2Yl9jb3JlIG1jIHNuZF9l
bXUxMGsxX3N5bnRoIHJhZGVvbigrKSBzbmRfZW11eF9zeW50aCBzbmRfc2VxX21pZGlfZW11
bCBzbmRfc2VxX3Zpcm1pZGkgZHJtX3R0bV9oZWxwZXIgc25kX3NlcV9taWRpIHNuZF9zZXFf
bWlkaV9ldmVudCB0dG0gc25kX3NlcSBlZGFjX21jZV9hbWQgc25kX2hkYV9jb2RlY19oZG1p
IHNoYTUxMl9zc3NlMyBzaGE1MTJfZ2VuZXJpYyBzaGEyNTZfc3NzZTMgc2hhMV9zc3NlMyBz
bmRfZW11MTBrMSBhZXNuaV9pbnRlbCBkcm1fc3ViYWxsb2NfaGVscGVyIHNuZF9oZGFfaW50
ZWwgZHJtX2Rpc3BsYXlfaGVscGVyIHNuZF9pbnRlbF9kc3BjZmcgc25kX2hkYV9jb2RlYyBz
bmRfdXRpbF9tZW0gZ2YxMjhtdWwgc25kX2FjOTdfY29kZWMgc25kX2hkYV9jb3JlIGRybV9r
bXNfaGVscGVyIGNyeXB0b19zaW1kIGNyeXB0ZCBhYzk3X2J1cyBzbmRfcmF3bWlkaSBrMTB0
ZW1wIHNuZF9zZXFfZGV2aWNlIHNuZF9od2RlcCBzbmRfcGNtIGRybSBhY3BpX2NwdWZyZXEg
ZXZkZXYgc2VyaW9fcmF3IHBjc3BrciBhdDI0IGVtdTEwazFfZ3AgZ2FtZXBvcnQgcmVnbWFw
X2kyYyBpMmNfYWxnb19iaXQgc25kX3RpbWVyIHZpZGVvIHNuZCBzcDUxMDBfdGNvIHNvdW5k
Y29yZSB3bWkgYnV0dG9uIGV4dDQgY3JjMzJjX2dlbmVyaWMgY3JjMTYgbWJjYWNoZSBqYmQy
IHVhcyB1c2Jfc3RvcmFnZSBoaWRfZ2VuZXJpYyB1c2JoaWQgaGlkIHNnIHNyX21vZCBjZHJv
bSBzZF9tb2QgYXRhX2dlbmVyaWMgZmlyZXdpcmVfb2hjaSBjcmMzMl9wY2xtdWwgY3JjMzJj
X2ludGVsIGFoY2kgaTJjX3BpaXg0IGZpcmV3aXJlX2NvcmUgY3JjX2l0dV90IHBhdGFfYXRp
aXhwIGxpYmFoY2kgaTJjX3NtYnVzIG9oY2lfcGNpIHhoY2lfcGNpIGxpYmF0YSB4aGNpX2hj
ZCBlaGNpX3BjaSBvaGNpX2hjZCByODE2OSBlaGNpX2hjZCByZWFsdGVrIHNjc2lfbW9kIG1k
aW9fZGV2cmVzIHVzYmNvcmUNCj4gWyAgIDIwLjE1MTU1MF0gIHNjc2lfY29tbW9uIGxpYnBo
eSB1c2JfY29tbW9uDQo+IFsgICAyMC4xNTE1NTNdIENSMjogMDAwMDAwMDAwMDAwMDA1MA0K
PiBbICAgMjAuMTUxNTU1XSAtLS1bIGVuZCB0cmFjZSAwMDAwMDAwMDAwMDAwMDAwIF0tLS0N
Cj4NCj4gUmVnYXJkcywNCj4NCj4gQXJ0aHVyLg0KDQotLSANCi0tDQpUaG9tYXMgWmltbWVy
bWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlv
bnMgR2VybWFueSBHbWJIDQpGcmFua2Vuc3RyYXNzZSAxNDYsIDkwNDYxIE51ZXJuYmVyZywg
R2VybWFueQ0KR0Y6IEl2byBUb3RldiwgQW5kcmV3IE15ZXJzLCBBbmRyZXcgTWNEb25hbGQs
IEJvdWRpZW4gTW9lcm1hbg0KSFJCIDM2ODA5IChBRyBOdWVybmJlcmcpDQoNCg==
