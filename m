Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F81CF2B3
	for <lists+amd-gfx@lfdr.de>; Tue, 30 Apr 2019 11:22:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B482F89186;
	Tue, 30 Apr 2019 09:22:55 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17A4689186
 for <amd-gfx@lists.freedesktop.org>; Tue, 30 Apr 2019 09:22:55 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id s15so20094266wra.12
 for <amd-gfx@lists.freedesktop.org>; Tue, 30 Apr 2019 02:22:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=pTBh/67Tzz7Friks8WTxpfTX4hpUPRit39SeSrXw9SY=;
 b=oyq7t13Q5M+Gq7C7IXvhXStcrORSjJrYcDT0eiIkX3NCXkHWjszU2RxEOQKSH9WgSB
 pzd320ZUeIjrjWDd8BONByWm/UsiIhEZqhiEqXFcfipJFypT/ckrejOzQDPrAuArEqMO
 h0ofTWzxmdIFmRYGiAZl3muzYAoI8LbqwxDREtft7BGz75zj0JHHPGVTCB3ZZJFO0ieo
 dcckQpXjCiKZ8XbIpbqR+FmdtKoDHOlK/xrFT3nQrV+JXMGdKGIlThFR0GHgjyoC39lN
 yF1VEkZB2mmUtfQUz6XA2sE1pA1fAFj82uvfxXNJJnMJRYLF3/Grb5XDH0Hrs2zIU4/h
 ShiA==
X-Gm-Message-State: APjAAAUifBSC2dnNpfXspElyovNCwcL/9raOTCPxlROLyeJzr95VzC6G
 rjlLj1Mzt9LTSc5pueHnolgE5QDD
X-Google-Smtp-Source: APXvYqy/lp13DF8wlN8gmf0aNCw8ZQ5+C1nP9rNduPGk0a92ijpd8/hsNs/umVRuLygGn46MZyi3Eg==
X-Received: by 2002:adf:e88b:: with SMTP id d11mr24046535wrm.327.1556616173561; 
 Tue, 30 Apr 2019 02:22:53 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id l127sm2468263wml.40.2019.04.30.02.22.52
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 30 Apr 2019 02:22:52 -0700 (PDT)
Subject: Re: [PATCH] drm/amdgpu: Unmap CSA under SR-IOV in KFD path
To: "Kuehling, Felix" <Felix.Kuehling@amd.com>,
 "Huang, Trigger" <Trigger.Huang@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
References: <1556447115-1689-1-git-send-email-Trigger.Huang@amd.com>
 <be96ca90-23c2-e442-42d0-7889436b0393@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <749d808b-5afc-488e-6d31-fae5e8dac208@gmail.com>
Date: Tue, 30 Apr 2019 11:22:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <be96ca90-23c2-e442-42d0-7889436b0393@amd.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=pTBh/67Tzz7Friks8WTxpfTX4hpUPRit39SeSrXw9SY=;
 b=g/Dh+OdT3qzAPU4Z7wHZEpT2lnQcwJSJzVH8JOH/tge2FAAT8WMGHiGgtDHMwfDjcQ
 Xp/7WI35LlQXQGaeX7jiy1lXsZXKJU0+c3ybu7L5ypZ8dLIPedvTiEALCWAQqkjX+jsV
 s/E+otoTwYht30ATInZqvXVq22jDXocaVYMVxyVBV0vvXPh2XpRWTUlKolsDli3cgi0u
 LSwdavOP0mfmSG6c5+7BSDX7Cz9+MN217Sy8+qr+nmYvOrKKbGDCgnFkDjH3/2Ah9iuo
 UPYJ9JpPu779eapqnpjMGNb8Zx9v3CVBgayGrYvBg8gEcQvLcVSOjG+eYJrgm/7JuleO
 3Rhg==
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
Reply-To: christian.koenig@amd.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

V2VsbCB0aGF0IGlzIGV4YWN0bHkgd2hhdCB3ZSBhbHJlYWR5IGRvIGhlcmUuIFRoZSBvbmx5IHBy
b2JsZW0gaXMgd2UgZG8gCnRoZSB3cm9uZyBjaGVjayBhbWRncHVfdm1fbWFrZV9jb21wdXRlKCku
CgpJbnN0ZWFkIG9mIGNoZWNraW5nIGlmIHNvbWUgcGFnZSB0YWJsZXMgYXJlIGFscmVhZHkgZmls
bGVkIHdlIGNoZWNrIGlmIApzb21lIG1hcHBpbmcgaXMgYWxyZWFkeSBtYWRlLgoKUmVnYXJkcywK
Q2hyaXN0aWFuLgoKQW0gMzAuMDQuMTkgdW0gMDE6MzQgc2NocmllYiBLdWVobGluZywgRmVsaXg6
Cj4gSSByZW1lbWJlciBhIHBhc3QgZGlzY3Vzc2lvbiB0byBjaGFuZ2UgdGhlIENTQSBhbGxvY2F0
aW9uL21hcHBpbmcgc2NoZW1lCj4gdG8gYXZvaWQgdGhpcyBpc3N1ZSBpbiB0aGUgZmlyc3QgcGxh
Y2UuIENhbiBhZGRpbmcgdGhlIENTQSB0byB0aGUgVk0gYmUKPiBkZWxheWVkIGEgbGl0dGxlIHRv
IGEgcG9pbnQgYWZ0ZXIgdGhlIFZNIGdldHMgY29udmVydGVkIHRvIGEgY29tcHV0ZSBWTT8KPiBN
YXliZSB0aGUgZmlyc3QgY29tbWFuZCBzdWJtaXNzaW9uPwo+Cj4gUmVnYXJkcywKPiAgIMKgIEZl
bGl4Cj4KPiBPbiAyMDE5LTA0LTI4IDY6MjUgYS5tLiwgVHJpZ2dlciBIdWFuZyB3cm90ZToKPj4g
SW4gYW1kZ3B1IG9wZW4gcGF0aCwgQ1NBIHdpbGwgYmUgbWFwcGVuZWQgaW4gVk0sIHNvIHdoZW4g
b3BlbmluZwo+PiBLRkQsIGNhbGxpbmcgbWRncHVfdm1fbWFrZV9jb21wdXRlICB3aWxsIGZhaWwg
YmVjYXVzZSBpdCBmb3VuZCB0aGlzCj4+IFZNIGlzIG5vdCBhIGNsZWFuIFZNIHdpdGggc29tZSBt
YXBwaW5ncywgYXMgYSByZXN1bHQsIGl0IHdpbGwgbGVhZAo+PiB0byBmYWlsZWQgdG8gY3JlYXRl
IHByb2Nlc3MgVk0gb2JqZWN0Cj4+Cj4+IFRoZSBmaXggaXMgdHJ5IHRvIHVubWFwIENTQSwgYW5k
IGFjdHVhbGx5IENTQSBpcyBub3QgbmVlZGVkIGluCj4+IGNvbXB1dGUgVkYgd29ybGQgc3dpdGNo
Cj4+Cj4+IFNpZ25lZC1vZmYtYnk6IFRyaWdnZXIgSHVhbmcgPFRyaWdnZXIuSHVhbmdAYW1kLmNv
bT4KPj4gLS0tCj4+ICAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9hbWRrZmRf
Z3B1dm0uYyB8IDEwICsrKysrKysrKysKPj4gICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X2ttcy5jICAgICAgICAgIHwgIDIgKy0KPj4gICAgMiBmaWxlcyBjaGFuZ2VkLCAxMSBp
bnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYW1ka2ZkX2dwdXZtLmMgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfYW1ka2ZkX2dwdXZtLmMKPj4gaW5kZXggNjk3YjhlZi4uZTBiYzQ1
NyAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2FtZGtm
ZF9ncHV2bS5jCj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9hbWRr
ZmRfZ3B1dm0uYwo+PiBAQCAtOTU2LDYgKzk1NiwxNiBAQCBpbnQgYW1kZ3B1X2FtZGtmZF9ncHV2
bV9hY3F1aXJlX3Byb2Nlc3Nfdm0oc3RydWN0IGtnZF9kZXYgKmtnZCwKPj4gICAgCWlmIChhdm0t
PnByb2Nlc3NfaW5mbykKPj4gICAgCQlyZXR1cm4gLUVJTlZBTDsKPj4gICAgCj4+ICsJLyogRGVs
ZXRlIENTQSBtYXBwaW5nIHRvIG1ha2Ugc3VyZSB0aGlzIFZNIGlzIGEgY2xlYW4gVk0gIGJlZm9y
ZQo+PiArCSAqICBjb252ZXJ0aW5nIFZNCj4+ICsJICovCj4+ICsJaWYgKGFtZGdwdV9zcmlvdl92
ZihhZGV2KSAmJiBkcnZfcHJpdi0+Y3NhX3ZhKSB7Cj4+ICsJCWFtZGdwdV9ib19yZXNlcnZlKGFk
ZXYtPnZpcnQuY3NhX29iaiwgdHJ1ZSk7Cj4+ICsJCWFtZGdwdV92bV9ib19ybXYoYWRldiwgZHJ2
X3ByaXYtPmNzYV92YSk7Cj4+ICsJCWRydl9wcml2LT5jc2FfdmEgPSBOVUxMOwo+PiArCQlhbWRn
cHVfYm9fdW5yZXNlcnZlKGFkZXYtPnZpcnQuY3NhX29iaik7Cj4+ICsJfQo+PiArCj4+ICAgIAkv
KiBDb252ZXJ0IFZNIGludG8gYSBjb21wdXRlIFZNICovCj4+ICAgIAlyZXQgPSBhbWRncHVfdm1f
bWFrZV9jb21wdXRlKGFkZXYsIGF2bSwgcGFzaWQpOwo+PiAgICAJaWYgKHJldCkKPj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9rbXMuYyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9rbXMuYwo+PiBpbmRleCBkYTdiNGZlLi4zNjFjMmU1
IDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfa21zLmMK
Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2ttcy5jCj4+IEBAIC0x
MDY5LDcgKzEwNjksNyBAQCB2b2lkIGFtZGdwdV9kcml2ZXJfcG9zdGNsb3NlX2ttcyhzdHJ1Y3Qg
ZHJtX2RldmljZSAqZGV2LAo+PiAgICAKPj4gICAgCWFtZGdwdV92bV9ib19ybXYoYWRldiwgZnBy
aXYtPnBydF92YSk7Cj4+ICAgIAo+PiAtCWlmIChhbWRncHVfc3Jpb3ZfdmYoYWRldikpIHsKPj4g
KwlpZiAoYW1kZ3B1X3NyaW92X3ZmKGFkZXYpICYmIGZwcml2LT5jc2FfdmEpIHsKPj4gICAgCQkv
KiBUT0RPOiBob3cgdG8gaGFuZGxlIHJlc2VydmUgZmFpbHVyZSAqLwo+PiAgICAJCUJVR19PTihh
bWRncHVfYm9fcmVzZXJ2ZShhZGV2LT52aXJ0LmNzYV9vYmosIHRydWUpKTsKPj4gICAgCQlhbWRn
cHVfdm1fYm9fcm12KGFkZXYsIGZwcml2LT5jc2FfdmEpOwo+IF9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gYW1kLWdmeCBtYWlsaW5nIGxpc3QKPiBhbWQt
Z2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vYW1kLWdmeAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9hbWQtZ2Z4
