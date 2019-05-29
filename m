Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56DE42D6E8
	for <lists+amd-gfx@lfdr.de>; Wed, 29 May 2019 09:47:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A61246E090;
	Wed, 29 May 2019 07:47:33 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B9C66E090
 for <amd-gfx@lists.freedesktop.org>; Wed, 29 May 2019 07:47:32 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id f8so964251wrt.1
 for <amd-gfx@lists.freedesktop.org>; Wed, 29 May 2019 00:47:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=dlnimFGCt3fVCMJO6UNnEDkMEXPl5PoUzKymn39QdcA=;
 b=f8XKAaA442ZHdvwkHUt/HxrbWYt8ru89/9TA9BRmuyeDfOMUKoZMfFP/w1IvWxXSyD
 hCiNqNmqzYCrEhTjIC3yPv6eoK1voJrBM8X6AR8b/k8zYpy5fWcDg+DOE2ubY9cd5LLu
 wQyw4eIa/krdTWRf2Gmr69Mi1z5YbCLK55n4+bG0nefS2Cst4uupAK7UxmszNorvB0Pv
 CbMQ6VdnIh1HqKdGP8pjtsEx9oZF1MD5X1rCuIZcCCeTsq0ESIYiVwv9cU7mK73UwOMY
 8TE5aFiuapjyj9WqpiTijjrVWoxvhkTrgDe2xRonzhWZ8GH92uCBlV30VnBiOgJLxcMt
 H2dA==
X-Gm-Message-State: APjAAAWQjL8U4kf1yB5Iv4ru/03cNto5ISb0YO7anOtTI2fIyB8M6X1D
 jCk+lwQAoBy65+tuhtIH4hdnDfjC
X-Google-Smtp-Source: APXvYqxYN2rYdrA+8mpYP77EFHBekTykVr/E2bXTEGirraz2olp1TIcoJckJygclExTNRzhQ/zzV8g==
X-Received: by 2002:a5d:5747:: with SMTP id q7mr36468615wrw.226.1559116050909; 
 Wed, 29 May 2019 00:47:30 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id 6sm32756661wrd.51.2019.05.29.00.47.29
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 29 May 2019 00:47:30 -0700 (PDT)
Subject: Re: [PATCH] drm/amdgpu: fix a race in GPU reset with IB test
To: Alex Deucher <alexdeucher@gmail.com>, amd-gfx@lists.freedesktop.org
References: <20190528192955.599-1-alexander.deucher@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <0307cdf4-2231-5d29-9666-28cfa0794ee7@gmail.com>
Date: Wed, 29 May 2019 09:47:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190528192955.599-1-alexander.deucher@amd.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=dlnimFGCt3fVCMJO6UNnEDkMEXPl5PoUzKymn39QdcA=;
 b=gPaFB77UEzW0IQCeajsJcGwRQjL9fc957it132SYSQYJ/jcOGhAypMh+/HzzL4NrP0
 BI8XEt2cGhbj/J7zU1c8MmhiAzWN1QQ7J9uLQVuWHylWTHl1mJf4mnX0CrEe+rt6OBkf
 6hHill0vOntCKTXyC8j4hj9hz91iV6Uwq5SXxkWWN8s2iMOtjz3we2t5JC5Qvz/4ZZjb
 uo6o9a+31mhIp3XbtXvNBO8OOzxVJTAOCyJlmguO7S+DxvKhQLSIPnBXoxdwHXgp1tcj
 TEm+YOjTvZS3i0VHpeDErvzD6qWKJRZnHZnKudbATOlVK9ficUTfWbyyJcvbyrlDLp2b
 JQHg==
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
Cc: Alex Deucher <alexander.deucher@amd.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QW0gMjguMDUuMTkgdW0gMjE6Mjkgc2NocmllYiBBbGV4IERldWNoZXI6Cj4gU3BsaXQgbGF0ZV9p
bml0IGludG8gdHdvIGZ1bmN0aW9ucywgb25lIChkb19sYXRlX2luaXQpIHdoaWNoCj4ganVzdCBk
b2VzIHRoZSBodyBpbml0LCBhbmQgbGF0ZV9pbml0IHdoaWNoIGNhbGxzIGRvX2xhdGVfaW5pdAo+
IGFuZCBzY2hlZHVsZXMgdGhlIElCIHRlc3Qgd29yay4gIENhbGwgZG9fbGF0ZV9pbml0IGluCj4g
dGhlIEdQVSByZXNldCBjb2RlIHRvIHJ1biB0aGUgaW5pdCBjb2RlLCBidXQgbm90IHNjaGVkdWxl
Cj4gdGhlIElCIHRlc3QgY29kZS4gIFRoZSBJQiB0ZXN0IGNvZGUgaXMgY2FsbGVkIGRpcmVjdGx5
Cj4gaW4gdGhlIGdwdSByZXNldCBjb2RlIHNvIG5vIG5lZWQgdG8gcnVuIHRoZSBJQiB0ZXN0cwo+
IGluIGEgc2VwYXJhdGUgd29yayB0aHJlYWQuICBJZiB3ZSBkbywgd2UgZW5kIHVwIHJhY2luZy4K
CkkgYWxyZWFkeSBoYWQgdGhlIHN1c3BpY2lvbiB0aGF0IHdlIGRvIHNvbWV0aGluZyB3cm9uZyBp
biB0aGUgcmVzZXQgcGF0aCAKd2l0aCB0aGlzLgoKQnV0IEkgZG9uJ3QgcmVhbGx5IGxpa2UgdGhl
IG5hbWluZy4gSG93IGFib3V0IHdlIGNhbGwgdGhlIGxhdGVfaW5pdF93b3JrIApkZWxheWVkX2lu
aXRfd29yayBpbnN0ZWFkIGFuZCBleHBsaWNpdGx5IHNjaGVkdWxlIGl0IGZyb20gCmFtZGdwdV9k
ZXZpY2VfaW5pdCgpID8KCkNocmlzdGlhbi4KCj4KPiBTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNo
ZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Cj4gLS0tCj4gICBkcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMgfCA0MyArKysrKysrKysrKysrLS0tLS0tLS0tCj4g
ICAxIGZpbGUgY2hhbmdlZCwgMjYgaW5zZXJ0aW9ucygrKSwgMTcgZGVsZXRpb25zKC0pCj4KPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jCj4gaW5kZXggN2E4YzIy
MDFjZDA0Li42YjkwODQwMzA3ZGMgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X2RldmljZS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X2RldmljZS5jCj4gQEAgLTE4NjksMTkgKzE4NjksNyBAQCBzdGF0aWMgaW50IGFtZGdw
dV9kZXZpY2Vfc2V0X3BnX3N0YXRlKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LCBlbnVtIGFt
ZF9wb3dlcgo+ICAgCXJldHVybiAwOwo+ICAgfQo+ICAgCj4gLS8qKgo+IC0gKiBhbWRncHVfZGV2
aWNlX2lwX2xhdGVfaW5pdCAtIHJ1biBsYXRlIGluaXQgZm9yIGhhcmR3YXJlIElQcwo+IC0gKgo+
IC0gKiBAYWRldjogYW1kZ3B1X2RldmljZSBwb2ludGVyCj4gLSAqCj4gLSAqIExhdGUgaW5pdGlh
bGl6YXRpb24gcGFzcyBmb3IgaGFyZHdhcmUgSVBzLiAgVGhlIGxpc3Qgb2YgYWxsIHRoZSBoYXJk
d2FyZQo+IC0gKiBJUHMgdGhhdCBtYWtlIHVwIHRoZSBhc2ljIGlzIHdhbGtlZCBhbmQgdGhlIGxh
dGVfaW5pdCBjYWxsYmFja3MgYXJlIHJ1bi4KPiAtICogbGF0ZV9pbml0IGNvdmVycyBhbnkgc3Bl
Y2lhbCBpbml0aWFsaXphdGlvbiB0aGF0IGFuIElQIHJlcXVpcmVzCj4gLSAqIGFmdGVyIGFsbCBv
ZiB0aGUgaGF2ZSBiZWVuIGluaXRpYWxpemVkIG9yIHNvbWV0aGluZyB0aGF0IG5lZWRzIHRvIGhh
cHBlbgo+IC0gKiBsYXRlIGluIHRoZSBpbml0IHByb2Nlc3MuCj4gLSAqIFJldHVybnMgMCBvbiBz
dWNjZXNzLCBuZWdhdGl2ZSBlcnJvciBjb2RlIG9uIGZhaWx1cmUuCj4gLSAqLwo+IC1zdGF0aWMg
aW50IGFtZGdwdV9kZXZpY2VfaXBfbGF0ZV9pbml0KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2
KQo+ICtzdGF0aWMgaW50IGFtZGdwdV9kZXZpY2VfZG9faXBfbGF0ZV9pbml0KHN0cnVjdCBhbWRn
cHVfZGV2aWNlICphZGV2KQo+ICAgewo+ICAgCWludCBpID0gMCwgcjsKPiAgIAo+IEBAIC0xOTAy
LDE0ICsxODkwLDM1IEBAIHN0YXRpYyBpbnQgYW1kZ3B1X2RldmljZV9pcF9sYXRlX2luaXQoc3Ry
dWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCj4gICAJYW1kZ3B1X2RldmljZV9zZXRfY2dfc3RhdGUo
YWRldiwgQU1EX0NHX1NUQVRFX0dBVEUpOwo+ICAgCWFtZGdwdV9kZXZpY2Vfc2V0X3BnX3N0YXRl
KGFkZXYsIEFNRF9QR19TVEFURV9HQVRFKTsKPiAgIAo+IC0JcXVldWVfZGVsYXllZF93b3JrKHN5
c3RlbV93cSwgJmFkZXYtPmxhdGVfaW5pdF93b3JrLAo+IC0JCQkgICBtc2Vjc190b19qaWZmaWVz
KEFNREdQVV9SRVNVTUVfTVMpKTsKPiAtCj4gICAJYW1kZ3B1X2RldmljZV9maWxsX3Jlc2V0X21h
Z2ljKGFkZXYpOwo+ICAgCj4gICAJcmV0dXJuIDA7Cj4gICB9Cj4gICAKPiArLyoqCj4gKyAqIGFt
ZGdwdV9kZXZpY2VfaXBfbGF0ZV9pbml0IC0gcnVuIGxhdGUgaW5pdCBmb3IgaGFyZHdhcmUgSVBz
Cj4gKyAqCj4gKyAqIEBhZGV2OiBhbWRncHVfZGV2aWNlIHBvaW50ZXIKPiArICoKPiArICogTGF0
ZSBpbml0aWFsaXphdGlvbiBwYXNzIGZvciBoYXJkd2FyZSBJUHMuICBUaGUgbGlzdCBvZiBhbGwg
dGhlIGhhcmR3YXJlCj4gKyAqIElQcyB0aGF0IG1ha2UgdXAgdGhlIGFzaWMgaXMgd2Fsa2VkIGFu
ZCB0aGUgbGF0ZV9pbml0IGNhbGxiYWNrcyBhcmUgcnVuLgo+ICsgKiBsYXRlX2luaXQgY292ZXJz
IGFueSBzcGVjaWFsIGluaXRpYWxpemF0aW9uIHRoYXQgYW4gSVAgcmVxdWlyZXMKPiArICogYWZ0
ZXIgYWxsIG9mIHRoZSBoYXZlIGJlZW4gaW5pdGlhbGl6ZWQgb3Igc29tZXRoaW5nIHRoYXQgbmVl
ZHMgdG8gaGFwcGVuCj4gKyAqIGxhdGUgaW4gdGhlIGluaXQgcHJvY2Vzcy4KPiArICogUmV0dXJu
cyAwIG9uIHN1Y2Nlc3MsIG5lZ2F0aXZlIGVycm9yIGNvZGUgb24gZmFpbHVyZS4KPiArICovCj4g
K3N0YXRpYyBpbnQgYW1kZ3B1X2RldmljZV9pcF9sYXRlX2luaXQoc3RydWN0IGFtZGdwdV9kZXZp
Y2UgKmFkZXYpCj4gK3sKPiArCWludCByOwo+ICsKPiArCXIgPSBhbWRncHVfZGV2aWNlX2RvX2lw
X2xhdGVfaW5pdChhZGV2KTsKPiArCj4gKwlxdWV1ZV9kZWxheWVkX3dvcmsoc3lzdGVtX3dxLCAm
YWRldi0+bGF0ZV9pbml0X3dvcmssCj4gKwkJCSAgIG1zZWNzX3RvX2ppZmZpZXMoQU1ER1BVX1JF
U1VNRV9NUykpOwo+ICsKPiArCXJldHVybiByOwo+ICt9Cj4gKwo+ICAgLyoqCj4gICAgKiBhbWRn
cHVfZGV2aWNlX2lwX2ZpbmkgLSBydW4gZmluaSBmb3IgaGFyZHdhcmUgSVBzCj4gICAgKgo+IEBA
IC0zNTAyLDcgKzM1MTEsNyBAQCBzdGF0aWMgaW50IGFtZGdwdV9kb19hc2ljX3Jlc2V0KHN0cnVj
dCBhbWRncHVfaGl2ZV9pbmZvICpoaXZlLAo+ICAgCQkJCWlmICh2cmFtX2xvc3QpCj4gICAJCQkJ
CWFtZGdwdV9kZXZpY2VfZmlsbF9yZXNldF9tYWdpYyh0bXBfYWRldik7Cj4gICAKPiAtCQkJCXIg
PSBhbWRncHVfZGV2aWNlX2lwX2xhdGVfaW5pdCh0bXBfYWRldik7Cj4gKwkJCQlyID0gYW1kZ3B1
X2RldmljZV9kb19pcF9sYXRlX2luaXQodG1wX2FkZXYpOwo+ICAgCQkJCWlmIChyKQo+ICAgCQkJ
CQlnb3RvIG91dDsKPiAgIAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
