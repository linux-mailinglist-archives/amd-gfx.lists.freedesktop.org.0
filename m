Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EE23141EA5
	for <lists+amd-gfx@lfdr.de>; Wed, 12 Jun 2019 10:08:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2A658937C;
	Wed, 12 Jun 2019 08:08:30 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C2B08937C
 for <amd-gfx@lists.freedesktop.org>; Wed, 12 Jun 2019 08:08:29 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id n9so15857577wru.0
 for <amd-gfx@lists.freedesktop.org>; Wed, 12 Jun 2019 01:08:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=svWp93LwC2evX/H9wsWMq3KKwg4qDJ345ehKF1vPqb4=;
 b=rAcvj/o67zI7EU72n//EVS2XQoDeuPBuFe821jj0Z+pwPREw79yp7Ua/bgbVT/6PTC
 BahmI9j1WmxVUwphqvW3hBVhI9SqsnlehqIfxB6QGZcsERYndhv6KSnKh2mOvoULF/FO
 8Dhzn/gf8dkEmE+xxfi4n0qGCuk8Sk/jPdxztTNB/hjvMY5n7eyNlPu98qQMCtTVW0JG
 PkXTZDlj6hsc2MCriv0ejYcaQf7Vr5bylQk19Q94EWHzsoH5zgIZeUwCMg/F1/lv6lxw
 KlChay6AH9HNMfieR0/IN7ehx9jY7bgiW0mvBkIPiTx/x8kfQN4FT0egHs+9MdR32U7h
 GJfA==
X-Gm-Message-State: APjAAAX2KJBrBPOU2arnr7cu68rhK0INaFzXdljijqIwQOJZPpIU+BBA
 OQ9m53VdFOvjZtAlUFF4zzgE2K1N
X-Google-Smtp-Source: APXvYqwN3FKN2ZiQh5AXshcXcMumPK4yx4flnb+dA1E8O1f1n0lrAA3jRMRIe7FGtPvbKsuV+2uNeg==
X-Received: by 2002:a05:6000:11c9:: with SMTP id
 i9mr4297816wrx.258.1560326908138; 
 Wed, 12 Jun 2019 01:08:28 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id v67sm4147470wme.24.2019.06.12.01.08.27
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 12 Jun 2019 01:08:27 -0700 (PDT)
Subject: Re: [PATCH] drm/amdgpu: explicitly set mmGDS_VMID0_BASE to 0
To: "Zhu, James" <James.Zhu@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
References: <1560187603-16238-1-git-send-email-James.Zhu@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <2eea4e60-194d-c7d6-4b29-2a7439f6edf3@gmail.com>
Date: Wed, 12 Jun 2019 10:08:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <1560187603-16238-1-git-send-email-James.Zhu@amd.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=svWp93LwC2evX/H9wsWMq3KKwg4qDJ345ehKF1vPqb4=;
 b=keRsAzKllaqi+ZDohyDalI0tY7aPtQS59dD/05E/EI02KTFcQ6CnAj/u/6Fuw54+9+
 yOtvIvPsNZTiJsloqCr7FqmbJAfsBt80rsNJilE/AZLNbcXBs5CIq7suUdbxQtvXiobV
 mO8QzsolP1Kc1t1v287F8BSV3c7bc7omR3GrC/q/enEPJG8N0hPRO5CmWpxq53JjQdsg
 pcjy0eJAEtFDlUZaV1vyeWnle7HtnccrhSJe8ErbuJM/eoaZNsbUazFyUHH3YWrc6Ugm
 lj7COOqEn7SBkfm1gq+WoEM5y/MOSf2PqCn3zdx+B/F6rY61VglDLsJs0N139L0DMOJ4
 urWQ==
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
Cc: "Shamis, Leonid" <Leonid.Shamis@amd.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QW0gMTAuMDYuMTkgdW0gMTk6MjYgc2NocmllYiBaaHUsIEphbWVzOgo+IEV4cGxpY2l0bHkgc2V0
IG1tR0RTX1ZNSUQwX0JBU0UgdG8gMC4gQWxzbyB1cGRhdGUKPiBHRFNfVk1JRDBfQkFTRS9fU0la
RSB3aXRoIGRpcmVjdCByZWdpc3RlciB3cml0ZXMuCj4KPiBTaWduZWQtb2ZmLWJ5OiBKYW1lcyBa
aHUgPEphbWVzLlpodUBhbWQuY29tPgo+IC0tLQo+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvZ2Z4X3Y5XzAuYyB8IDMzICsrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLQo+ICAg
MSBmaWxlIGNoYW5nZWQsIDE1IGluc2VydGlvbnMoKyksIDE4IGRlbGV0aW9ucygtKQo+Cj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92OV8wLmMgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjlfMC5jCj4gaW5kZXggYmEzNmEyOC4uNzhjNzllOSAx
MDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjlfMC5jCj4gKysr
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y5XzAuYwo+IEBAIC0zMDUsNiArMzA1
LDcgQEAgc3RhdGljIGludCBnZnhfdjlfMF9nZXRfY3VfaW5mbyhzdHJ1Y3QgYW1kZ3B1X2Rldmlj
ZSAqYWRldiwKPiAgIHN0YXRpYyB1aW50NjRfdCBnZnhfdjlfMF9nZXRfZ3B1X2Nsb2NrX2NvdW50
ZXIoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpOwo+ICAgc3RhdGljIHZvaWQgZ2Z4X3Y5XzBf
c2VsZWN0X3NlX3NoKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LCB1MzIgc2VfbnVtLCB1MzIg
c2hfbnVtLCB1MzIgaW5zdGFuY2UpOwo+ICAgc3RhdGljIHZvaWQgZ2Z4X3Y5XzBfcmluZ19lbWl0
X2RlX21ldGEoc3RydWN0IGFtZGdwdV9yaW5nICpyaW5nKTsKPiArc3RhdGljIHU2NCBnZnhfdjlf
MF9yaW5nX2dldF9ycHRyX2NvbXB1dGUoc3RydWN0IGFtZGdwdV9yaW5nICpyaW5nKTsKPiAgIAo+
ICAgc3RhdGljIHZvaWQgZ2Z4X3Y5XzBfaW5pdF9nb2xkZW5fcmVnaXN0ZXJzKHN0cnVjdCBhbWRn
cHVfZGV2aWNlICphZGV2KQo+ICAgewo+IEBAIC0zNjMwLDI1ICszNjMxLDIwIEBAIHN0YXRpYyBj
b25zdCBzdHJ1Y3Qgc29jMTVfcmVnX2VudHJ5IHNlY19kZWRfY291bnRlcl9yZWdpc3RlcnNbXSA9
IHsKPiAgICAgIHsgU09DMTVfUkVHX0VOVFJZKEdDLCAwLCBtbVNRQ19FRENfQ05UMyksIDAsIDQs
IDZ9LAo+ICAgfTsKPiAgIAo+IC0KPiAgIHN0YXRpYyBpbnQgZ2Z4X3Y5XzBfZG9fZWRjX2dkc193
b3JrYXJvdW5kcyhzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKPiAgIHsKPiAgIAlzdHJ1Y3Qg
YW1kZ3B1X3JpbmcgKnJpbmcgPSAmYWRldi0+Z2Z4LmNvbXB1dGVfcmluZ1swXTsKPiAtCWludCBy
Owo+ICsJaW50IGksIHI7Cj4gICAKPiAtCXIgPSBhbWRncHVfcmluZ19hbGxvYyhyaW5nLCAxNyk7
Cj4gKwlyID0gYW1kZ3B1X3JpbmdfYWxsb2MocmluZywgNyk7Cj4gICAJaWYgKHIpIHsKPiAgIAkJ
RFJNX0VSUk9SKCJhbWRncHU6IEdEUyB3b3JrYXJvdW5kcyBmYWlsZWQgdG8gbG9jayByaW5nICVz
ICglZCkuXG4iLAo+ICAgCQkJcmluZy0+bmFtZSwgcik7Cj4gICAJCXJldHVybiByOwo+ICAgCX0K
PiAgIAo+IC0JYW1kZ3B1X3Jpbmdfd3JpdGUocmluZywgUEFDS0VUMyhQQUNLRVQzX1dSSVRFX0RB
VEEsIDMpKTsKPiAtCWFtZGdwdV9yaW5nX3dyaXRlKHJpbmcsIFdSSVRFX0RBVEFfRU5HSU5FX1NF
TCgwKSB8Cj4gLQkJCQlXUklURV9EQVRBX0RTVF9TRUwoMCkpOwo+IC0JYW1kZ3B1X3Jpbmdfd3Jp
dGUocmluZywgU09DMTVfUkVHX09GRlNFVChHQywgMCwgbW1HRFNfVk1JRDBfU0laRSkpOwo+IC0J
YW1kZ3B1X3Jpbmdfd3JpdGUocmluZywgMCk7Cj4gLQlhbWRncHVfcmluZ193cml0ZShyaW5nLCBh
ZGV2LT5nZHMuZ2RzX3NpemUpOwo+ICsJV1JFRzMyX1NPQzE1KEdDLCAwLCBtbUdEU19WTUlEMF9C
QVNFLCAweDAwMDAwMDAwKTsKPiArCVdSRUczMl9TT0MxNShHQywgMCwgbW1HRFNfVk1JRDBfU0la
RSwgYWRldi0+Z2RzLmdkc19zaXplKTsKPiAgIAo+ICAgCWFtZGdwdV9yaW5nX3dyaXRlKHJpbmcs
IFBBQ0tFVDMoUEFDS0VUM19ETUFfREFUQSwgNSkpOwo+ICAgCWFtZGdwdV9yaW5nX3dyaXRlKHJp
bmcsIChQQUNLRVQzX0RNQV9EQVRBX0NQX1NZTkMgfAo+IEBAIC0zNjYyLDE4ICszNjU4LDE5IEBA
IHN0YXRpYyBpbnQgZ2Z4X3Y5XzBfZG9fZWRjX2dkc193b3JrYXJvdW5kcyhzdHJ1Y3QgYW1kZ3B1
X2RldmljZSAqYWRldikKPiAgIAlhbWRncHVfcmluZ193cml0ZShyaW5nLCBQQUNLRVQzX0RNQV9E
QVRBX0NNRF9SQVdfV0FJVCB8Cj4gICAJCQkJYWRldi0+Z2RzLmdkc19zaXplKTsKPiAgIAo+IC0J
YW1kZ3B1X3Jpbmdfd3JpdGUocmluZywgUEFDS0VUMyhQQUNLRVQzX1dSSVRFX0RBVEEsIDMpKTsK
PiAtCWFtZGdwdV9yaW5nX3dyaXRlKHJpbmcsIFdSSVRFX0RBVEFfRU5HSU5FX1NFTCgwKSB8Cj4g
LQkJCQlXUklURV9EQVRBX0RTVF9TRUwoMCkpOwo+IC0JYW1kZ3B1X3Jpbmdfd3JpdGUocmluZywg
U09DMTVfUkVHX09GRlNFVChHQywgMCwgbW1HRFNfVk1JRDBfU0laRSkpOwo+IC0JYW1kZ3B1X3Jp
bmdfd3JpdGUocmluZywgMCk7Cj4gLQlhbWRncHVfcmluZ193cml0ZShyaW5nLCAweDApOwo+IC0K
PiAgIAlhbWRncHVfcmluZ19jb21taXQocmluZyk7Cj4gICAKPiAtCXJldHVybiAwOwo+IC19Cj4g
Kwlmb3IgKGkgPSAwOyAoaSA8IGFkZXYtPnVzZWNfdGltZW91dCkgJiYKPiArCQkJKHJpbmctPndw
dHIgIT0gZ2Z4X3Y5XzBfcmluZ19nZXRfcnB0cl9jb21wdXRlKHJpbmcpKTsgaSsrKQoKVGhlIGlu
ZGVudGF0aW9uIGhlcmUgbG9va3Mgd3Jvbmcgb24gZmlyc3QgZ2xhbmNlIGFuZCB5b3UgZG9uJ3Qg
bmVlZCB0aGUgCmV4dHJhICgpLgoKTWlnaHQgYmUgYmV0dGVyIHRvIHdyaXRlIHRoaXMgYXMgZm9y
ICsgaWYuLmJyZWFrLgoKPiArCQlEUk1fVURFTEFZKDEpOwo+ICsKPiArCWlmIChpID49IGFkZXYt
PnVzZWNfdGltZW91dCkKPiArCQlyID0gLUVUSU1FRE9VVDsKPiArCj4gKwlXUkVHMzJfU09DMTUo
R0MsIDAsIG1tR0RTX1ZNSUQwX1NJWkUsIDB4MDAwMDAwMDApOwo+ICAgCj4gKwlyZXR1cm4gcjsK
PiArfQo+ICAgCj4gICBzdGF0aWMgaW50IGdmeF92OV8wX2RvX2VkY19ncHJfd29ya2Fyb3VuZHMo
c3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCj4gICB7CgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2FtZC1nZng=
