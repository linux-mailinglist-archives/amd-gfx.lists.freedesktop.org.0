Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A09ECCF462
	for <lists+amd-gfx@lfdr.de>; Tue,  8 Oct 2019 09:59:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 249346E226;
	Tue,  8 Oct 2019 07:59:22 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB2DC6E226
 for <amd-gfx@lists.freedesktop.org>; Tue,  8 Oct 2019 07:59:19 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id r19so2039656wmh.2
 for <amd-gfx@lists.freedesktop.org>; Tue, 08 Oct 2019 00:59:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=QrnEED7rZ9FQqkSca+dqiy0HazLsty+i0+YM7eH8lJU=;
 b=H01+j1pvz+P9MMme3k/hBRwO74C49iokFccVQc1Y4xPQrly8zdhvQk4FSebO1Rh99U
 4APyOj6RFlXGhmekVAUUbBHrXdQ4pUvtIs4/tD7x1DBBADU3viDp/9WGgn99lTBM+iP+
 L9bFF3BIhRtdsuPejF4f1F9eswAh0EpGClugNQOE0rDuF5lM2e4FNMFEDCO+B0ms3UO7
 i1RGKp2CCPB7Vp7IPLcoByaDcddRTpUrWnbZsXUMDQBmtxTNdJz77M5YvP+LdsC9zRSP
 zCe+5fSZTeb2CZSPuEtCG4GjEMgbjXg1BYo2cq6TbYFFke5Q+Px5/tV4Ihyhx6eJTFG/
 /YFQ==
X-Gm-Message-State: APjAAAXfd9XVMYj5l0NV6u6uieSw1JjsMKQIxDq0beb57YfN9CORJL/I
 ipmvSihGZ4dIlkprUdlSQBU=
X-Google-Smtp-Source: APXvYqyOR0dtHhFtvSR/GbkNivO/s2pXfgGof0wATn2QIItMfGFusrIVInu4000n7oLyT0DMU2edUg==
X-Received: by 2002:a7b:ce93:: with SMTP id q19mr2588187wmj.11.1570521558489; 
 Tue, 08 Oct 2019 00:59:18 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id q15sm36576804wrg.65.2019.10.08.00.59.16
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 08 Oct 2019 00:59:17 -0700 (PDT)
Subject: Re: [PATCH 1/2] drm/amdgpu: Clean up gmc_v9_0_gart_enable
To: "Zeng, Oak" <Oak.Zeng@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
References: <1570480448-29861-1-git-send-email-Oak.Zeng@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <0362dc2a-d23f-6c75-31f0-383af04a827e@gmail.com>
Date: Tue, 8 Oct 2019 09:59:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1570480448-29861-1-git-send-email-Oak.Zeng@amd.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=QrnEED7rZ9FQqkSca+dqiy0HazLsty+i0+YM7eH8lJU=;
 b=fohucz4WPqu+//Uupj8A9Du7vb2i9pvEXbU6XBSwf1o6rHhFlcY5SGZg2zTuEcYXzd
 b4kj+jqKoQrh6iExxpgGSVVyJ3g7WQ11FVwtxFhbWIoO5u8bKpmNCjt1bpRFzkp8ZMUU
 OrolTXjSwXlmM5FJf/mRpFp4SIVf/181w8EDHez/77leLjKW+5dSHVSaweoUW797ln7Z
 xdiMx4v4jWmtzWucvOvzDJk6yTzdBe+Ze8klKpCZ0wGSN2njidIybWkLYg5W8Svw52mi
 JcU65wGBPgfabPWbKCfLFZkNtMJ4cNncqw9ih8D5bVx+/iSHOV3+Dqm3UJ1B+s6y87q7
 CuUg==
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
Cc: "Kuehling, Felix" <Felix.Kuehling@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QW0gMDcuMTAuMTkgdW0gMjI6MzQgc2NocmllYiBaZW5nLCBPYWs6Cj4gTWFueSBsb2dpYyBpbiB0
aGlzIGZ1bmN0aW9uIGFyZSBIRFAgc2V0IHVwLAo+IG5vdCBnYXJ0IHNldCB1cC4gTW92ZWQgdGhv
c2UgbG9naWMgdG8gZ21jX3Y5XzBfaHdfaW5pdC4KPiBObyBmdW5jdGlvbmFsIGNoYW5nZS4KPgo+
IENoYW5nZS1JZDogSWIwMGNjMWZmZDFlNDg2ZTc3NTcxNzk2ZGNlNTNhYTc1MDZjMGM1NWYKPiBT
aWduZWQtb2ZmLWJ5OiBPYWsgWmVuZyA8T2FrLlplbmdAYW1kLmNvbT4KCk9uZSBtaW5vciBub3Rl
IG9uIHRoZSBjb2Rpbmcgc3R5bGUgYmVsb3csIGFwYXJ0IGZyb20gdGhhdCB0aGUgcGF0Y2ggaXMg
CkFja2VkLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+LgoK
PiAtLS0KPiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192OV8wLmMgfCA4MiArKysr
KysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDQxIGlu
c2VydGlvbnMoKyksIDQxIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2dtY192OV8wLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9n
bWNfdjlfMC5jCj4gaW5kZXggNGIxMWY3ZS4uYzdlMDdmMSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjlfMC5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvZ21jX3Y5XzAuYwo+IEBAIC0xMTM1LDEzICsxMTM1LDcgQEAgc3RhdGljIHZvaWQg
Z21jX3Y5XzBfaW5pdF9nb2xkZW5fcmVnaXN0ZXJzKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2
KQo+ICAgICovCj4gICBzdGF0aWMgaW50IGdtY192OV8wX2dhcnRfZW5hYmxlKHN0cnVjdCBhbWRn
cHVfZGV2aWNlICphZGV2KQo+ICAgewo+IC0JaW50IHIsIGk7Cj4gLQlib29sIHZhbHVlOwo+IC0J
dTMyIHRtcDsKPiAtCj4gLQlhbWRncHVfZGV2aWNlX3Byb2dyYW1fcmVnaXN0ZXJfc2VxdWVuY2Uo
YWRldiwKPiAtCQkJCQkJZ29sZGVuX3NldHRpbmdzX3ZlZ2ExMF9oZHAsCj4gLQkJCQkJCUFSUkFZ
X1NJWkUoZ29sZGVuX3NldHRpbmdzX3ZlZ2ExMF9oZHApKTsKPiArCWludCByOwo+ICAgCj4gICAJ
aWYgKGFkZXYtPmdhcnQuYm8gPT0gTlVMTCkgewo+ICAgCQlkZXZfZXJyKGFkZXYtPmRldiwgIk5v
IFZSQU0gb2JqZWN0IGZvciBQQ0lFIEdBUlQuXG4iKTsKPiBAQCAtMTE1MSwxNSArMTE0NSw2IEBA
IHN0YXRpYyBpbnQgZ21jX3Y5XzBfZ2FydF9lbmFibGUoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFk
ZXYpCj4gICAJaWYgKHIpCj4gICAJCXJldHVybiByOwo+ICAgCj4gLQlzd2l0Y2ggKGFkZXYtPmFz
aWNfdHlwZSkgewo+IC0JY2FzZSBDSElQX1JBVkVOOgo+IC0JCS8qIFRPRE8gZm9yIHJlbm9pciAq
Lwo+IC0JCW1taHViX3YxXzBfdXBkYXRlX3Bvd2VyX2dhdGluZyhhZGV2LCB0cnVlKTsKPiAtCQli
cmVhazsKPiAtCWRlZmF1bHQ6Cj4gLQkJYnJlYWs7Cj4gLQl9Cj4gLQo+ICAgCXIgPSBnZnhodWJf
djFfMF9nYXJ0X2VuYWJsZShhZGV2KTsKPiAgIAlpZiAocikKPiAgIAkJcmV0dXJuIHI7Cj4gQEAg
LTExNzEsNiArMTE1Niw0NiBAQCBzdGF0aWMgaW50IGdtY192OV8wX2dhcnRfZW5hYmxlKHN0cnVj
dCBhbWRncHVfZGV2aWNlICphZGV2KQo+ICAgCWlmIChyKQo+ICAgCQlyZXR1cm4gcjsKPiAgIAo+
ICsJRFJNX0lORk8oIlBDSUUgR0FSVCBvZiAldU0gZW5hYmxlZCAodGFibGUgYXQgMHglMDE2bGxY
KS5cbiIsCj4gKwkJICh1bnNpZ25lZCkoYWRldi0+Z21jLmdhcnRfc2l6ZSA+PiAyMCksCj4gKwkJ
ICh1bnNpZ25lZCBsb25nIGxvbmcpYW1kZ3B1X2JvX2dwdV9vZmZzZXQoYWRldi0+Z2FydC5ibykp
Owo+ICsJYWRldi0+Z2FydC5yZWFkeSA9IHRydWU7Cj4gKwlyZXR1cm4gMDsKPiArfQo+ICsKPiAr
c3RhdGljIGludCBnbWNfdjlfMF9od19pbml0KHZvaWQgKmhhbmRsZSkKPiArewo+ICsJaW50IHIs
IGk7Cj4gKwlib29sIHZhbHVlOwo+ICsJdTMyIHRtcDsKPiArCXN0cnVjdCBhbWRncHVfZGV2aWNl
ICphZGV2ID0gKHN0cnVjdCBhbWRncHVfZGV2aWNlICopaGFuZGxlOwoKV2UgdXN1YWxseSB0cnkg
dG8gaGF2ZSB2YXJpYWJsZXMgbGlrZSByIGFuZCBpIGRlY2xhcmVkIGxhc3QgYW5kIGxvbmcgCnN0
cnVjdHVyZSBkZWZpbmVzIGZpcnN0LgoKUmVnYXJkcywKQ2hyaXN0aWFuLgoKPiArCj4gKwkvKiBU
aGUgc2VxdWVuY2Ugb2YgdGhlc2UgdHdvIGZ1bmN0aW9uIGNhbGxzIG1hdHRlcnMuKi8KPiArCWdt
Y192OV8wX2luaXRfZ29sZGVuX3JlZ2lzdGVycyhhZGV2KTsKPiArCj4gKwlpZiAoYWRldi0+bW9k
ZV9pbmZvLm51bV9jcnRjKSB7Cj4gKwkJaWYgKGFkZXYtPmFzaWNfdHlwZSAhPSBDSElQX0FSQ1RV
UlVTKSB7Cj4gKwkJCS8qIExvY2tvdXQgYWNjZXNzIHRocm91Z2ggVkdBIGFwZXJ0dXJlKi8KPiAr
CQkJV1JFRzMyX0ZJRUxEMTUoRENFLCAwLCBWR0FfSERQX0NPTlRST0wsIFZHQV9NRU1PUllfRElT
QUJMRSwgMSk7Cj4gKwo+ICsJCQkvKiBkaXNhYmxlIFZHQSByZW5kZXIgKi8KPiArCQkJV1JFRzMy
X0ZJRUxEMTUoRENFLCAwLCBWR0FfUkVOREVSX0NPTlRST0wsIFZHQV9WU1RBVFVTX0NOVEwsIDAp
Owo+ICsJCX0KPiArCX0KPiArCj4gKwlhbWRncHVfZGV2aWNlX3Byb2dyYW1fcmVnaXN0ZXJfc2Vx
dWVuY2UoYWRldiwKPiArCQkJCQkJZ29sZGVuX3NldHRpbmdzX3ZlZ2ExMF9oZHAsCj4gKwkJCQkJ
CUFSUkFZX1NJWkUoZ29sZGVuX3NldHRpbmdzX3ZlZ2ExMF9oZHApKTsKPiArCj4gKwlzd2l0Y2gg
KGFkZXYtPmFzaWNfdHlwZSkgewo+ICsJY2FzZSBDSElQX1JBVkVOOgo+ICsJCS8qIFRPRE8gZm9y
IHJlbm9pciAqLwo+ICsJCW1taHViX3YxXzBfdXBkYXRlX3Bvd2VyX2dhdGluZyhhZGV2LCB0cnVl
KTsKPiArCQlicmVhazsKPiArCWRlZmF1bHQ6Cj4gKwkJYnJlYWs7Cj4gKwl9Cj4gKwo+ICAgCVdS
RUczMl9GSUVMRDE1KEhEUCwgMCwgSERQX01JU0NfQ05UTCwgRkxVU0hfSU5WQUxJREFURV9DQUNI
RSwgMSk7Cj4gICAKPiAgIAl0bXAgPSBSUkVHMzJfU09DMTUoSERQLCAwLCBtbUhEUF9IT1NUX1BB
VEhfQ05UTCk7Cj4gQEAgLTExOTksMzEgKzEyMjQsNiBAQCBzdGF0aWMgaW50IGdtY192OV8wX2dh
cnRfZW5hYmxlKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQo+ICAgCWlmIChhZGV2LT51bWMu
ZnVuY3MgJiYgYWRldi0+dW1jLmZ1bmNzLT5pbml0X3JlZ2lzdGVycykKPiAgIAkJYWRldi0+dW1j
LmZ1bmNzLT5pbml0X3JlZ2lzdGVycyhhZGV2KTsKPiAgIAo+IC0JRFJNX0lORk8oIlBDSUUgR0FS
VCBvZiAldU0gZW5hYmxlZCAodGFibGUgYXQgMHglMDE2bGxYKS5cbiIsCj4gLQkJICh1bnNpZ25l
ZCkoYWRldi0+Z21jLmdhcnRfc2l6ZSA+PiAyMCksCj4gLQkJICh1bnNpZ25lZCBsb25nIGxvbmcp
YW1kZ3B1X2JvX2dwdV9vZmZzZXQoYWRldi0+Z2FydC5ibykpOwo+IC0JYWRldi0+Z2FydC5yZWFk
eSA9IHRydWU7Cj4gLQlyZXR1cm4gMDsKPiAtfQo+IC0KPiAtc3RhdGljIGludCBnbWNfdjlfMF9o
d19pbml0KHZvaWQgKmhhbmRsZSkKPiAtewo+IC0JaW50IHI7Cj4gLQlzdHJ1Y3QgYW1kZ3B1X2Rl
dmljZSAqYWRldiA9IChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqKWhhbmRsZTsKPiAtCj4gLQkvKiBU
aGUgc2VxdWVuY2Ugb2YgdGhlc2UgdHdvIGZ1bmN0aW9uIGNhbGxzIG1hdHRlcnMuKi8KPiAtCWdt
Y192OV8wX2luaXRfZ29sZGVuX3JlZ2lzdGVycyhhZGV2KTsKPiAtCj4gLQlpZiAoYWRldi0+bW9k
ZV9pbmZvLm51bV9jcnRjKSB7Cj4gLQkJaWYgKGFkZXYtPmFzaWNfdHlwZSAhPSBDSElQX0FSQ1RV
UlVTKSB7Cj4gLQkJCS8qIExvY2tvdXQgYWNjZXNzIHRocm91Z2ggVkdBIGFwZXJ0dXJlKi8KPiAt
CQkJV1JFRzMyX0ZJRUxEMTUoRENFLCAwLCBWR0FfSERQX0NPTlRST0wsIFZHQV9NRU1PUllfRElT
QUJMRSwgMSk7Cj4gLQo+IC0JCQkvKiBkaXNhYmxlIFZHQSByZW5kZXIgKi8KPiAtCQkJV1JFRzMy
X0ZJRUxEMTUoRENFLCAwLCBWR0FfUkVOREVSX0NPTlRST0wsIFZHQV9WU1RBVFVTX0NOVEwsIDAp
Owo+IC0JCX0KPiAtCX0KPiAtCj4gICAJciA9IGdtY192OV8wX2dhcnRfZW5hYmxlKGFkZXYpOwo+
ICAgCj4gICAJcmV0dXJuIHI7CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1n
Zng=
