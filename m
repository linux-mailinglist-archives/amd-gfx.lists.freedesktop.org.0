Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1486FB78FC
	for <lists+amd-gfx@lfdr.de>; Thu, 19 Sep 2019 14:12:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 602186F448;
	Thu, 19 Sep 2019 12:12:20 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 603E06F448
 for <amd-gfx@lists.freedesktop.org>; Thu, 19 Sep 2019 12:12:19 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id i16so4210832wmd.3
 for <amd-gfx@lists.freedesktop.org>; Thu, 19 Sep 2019 05:12:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=LOu4q8JTkPzzcDyWu0c9S1IREscZAgjYCpZf4z+wWmI=;
 b=o3M8V4Usl8Hy9/MLbcL4lZnBHYLQ7/B7i0H9musEQKeH3UnJxHLoCR9NVXMWgG9Zte
 grXBFxwpHbEv+eiyhO23fLvDRTPjw4s2UwFJMSks06xDciZlEhMVeW6AAsxyoeKXxmKY
 tL0nk9nYV/GnENqX9zu41CUdUc2/9ePFEsFmeiD1r5S9UgpQgLBHbEcdCcBCn8YfO/Nl
 sQTvfojjKYS/P+dEH1l42l6d/2De1qJh0dj2km272x3AcbSBPlZoACXR9212n+FOc8s5
 +Qt4UxyaDvKkiuavVthg2jiAxbIGPB0txiV9Hu2HzE0MhXDw/WnbqovaVGUbFUxZ1Kxp
 QCTw==
X-Gm-Message-State: APjAAAWZ2XH0PC1xZWxLfj7J4SKDoCB3JIwsz2UF8IZM1aEJbtV4t1zu
 x/X3MK9NTgoJnVvDHGBTyc37z0yS
X-Google-Smtp-Source: APXvYqx6WOuOO9PHCd8UhjJeD96EVQTDI+EyFWK8WzJuxjnWU1o6adKbyIgusmJHcWNYqoZo2pruhA==
X-Received: by 2002:a1c:cc0e:: with SMTP id h14mr2583657wmb.117.1568895137871; 
 Thu, 19 Sep 2019 05:12:17 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id o9sm13914905wrh.46.2019.09.19.05.12.16
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 19 Sep 2019 05:12:16 -0700 (PDT)
Subject: Re: [PATCH v5] drm/amd/amdgpu:Fix compute ring unable to detect hang.
To: Jesse Zhang <zhexi.zhang@amd.com>, amd-gfx@lists.freedesktop.org
References: <1568880041-19830-1-git-send-email-zhexi.zhang@amd.com>
 <1568887741-1029-1-git-send-email-zhexi.zhang@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <490fd2ab-7d83-04a0-f4ea-fe67727bc013@gmail.com>
Date: Thu, 19 Sep 2019 14:12:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1568887741-1029-1-git-send-email-zhexi.zhang@amd.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=LOu4q8JTkPzzcDyWu0c9S1IREscZAgjYCpZf4z+wWmI=;
 b=ao5YHO5yu9JqR7gbCya6fwplWrfnsh9XVfy81TwFwP1D+nV+7ciy6bpVpRYF369h9X
 ep+IJ5EcoNzu6tkgZ03XpqF2KnqhUDW8/40u3XJUUpvCBw9XZJUhshGIIQUHYdscs+XZ
 z7Y7a+5bJMDp8hDVZZabe3lqw299AqM21LuiYuY5QG48wvdDxpfP+ZGm9nOtPiBkFwSu
 VCnAv6kkMbs6h5FKo6wIAg9WHzQ1OdcyJDmXAk76wpY/6L1yFnpAsii7drSHNeWu4zHT
 /gjAZFdQkffIKBfKUkznhQuZrRewjDCeU5P3H3GXTQIz0ipbXKL1YIZHPd1KaGoltZm/
 GTMQ==
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

QW0gMTkuMDkuMTkgdW0gMTI6MDkgc2NocmllYiBKZXNzZSBaaGFuZzoKPiBXaGVuIGNvbXB1dGUg
ZmVuY2UgZGlkIHNpZ25hbCwgY29tcHV0ZSByaW5nIGNhbm5vdCBkZXRlY3QgaGFyZHdhcmUgaGFu
Zwo+IGJlY2F1c2UgaXRzIHRpbWVvdXQgdmFsdWUgaXMgc2V0IHRvIGJlIGluZmluaXRlIGJ5IGRl
ZmF1bHQuCj4KPiBJbiBTUi1JT1YgYW5kIHBhc3N0aHJvdWdoIG1vZGUsIGlmIHVzZXIgZG9lcyBu
b3QgZGVjbGFyZSBjdXN0b21lIHRpbWVvdXQKPiB2YWx1ZSBmb3IgY29tcHV0ZSByaW5nLCB0aGVu
IHVzZSBnZnggcmluZyB0aW1lb3V0IHZhbHVlIGFzIGRlZmF1bHQuIFNvCj4gdGhhdCB3aGVuIHRo
ZXJlIGlzIGEgdHVyZSBoYXJkd2FyZSBoYW5nLCBjb21wdXRlIHJpbmcgY2FuIGRldGVjdCBpdC4K
Pgo+IENoYW5nZS1JZDogSTc5NGVjMDg2OGM2YzBhYWQ0MDc3NDk0NTcyNjBlY2ZlZTA2MTdjMTAK
PiBTaWduZWQtb2ZmLWJ5OiBKZXNzZSBaaGFuZyA8emhleGkuemhhbmdAYW1kLmNvbT4KPiAtLS0K
PiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYyB8IDEyICsrKysr
Ky0tLS0tLQo+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rydi5jICAgIHwg
IDQgKysrLQo+ICAgMiBmaWxlcyBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25z
KC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rl
dmljZS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jCj4gaW5k
ZXggM2I1MjgyYi4uMDNhYzVhMWRhIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV9kZXZpY2UuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV9kZXZpY2UuYwo+IEBAIC0xMDI0LDEyICsxMDI0LDYgQEAgc3RhdGljIGludCBhbWRn
cHVfZGV2aWNlX2NoZWNrX2FyZ3VtZW50cyhzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKPiAg
IAo+ICAgCWFtZGdwdV9kZXZpY2VfY2hlY2tfYmxvY2tfc2l6ZShhZGV2KTsKPiAgIAo+IC0JcmV0
ID0gYW1kZ3B1X2RldmljZV9nZXRfam9iX3RpbWVvdXRfc2V0dGluZ3MoYWRldik7Cj4gLQlpZiAo
cmV0KSB7Cj4gLQkJZGV2X2VycihhZGV2LT5kZXYsICJpbnZhbGlkIGxvY2t1cF90aW1lb3V0IHBh
cmFtZXRlciBzeW50YXhcbiIpOwo+IC0JCXJldHVybiByZXQ7Cj4gLQl9Cj4gLQo+ICAgCWFkZXYt
PmZpcm13YXJlLmxvYWRfdHlwZSA9IGFtZGdwdV91Y29kZV9nZXRfbG9hZF90eXBlKGFkZXYsIGFt
ZGdwdV9md19sb2FkX3R5cGUpOwo+ICAgCj4gICAJcmV0dXJuIHJldDsKPiBAQCAtMjczMiw2ICsy
NzI2LDEyIEBAIGludCBhbWRncHVfZGV2aWNlX2luaXQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFk
ZXYsCj4gICAJaWYgKHIpCj4gICAJCXJldHVybiByOwo+ICAgCj4gKwlyID0gYW1kZ3B1X2Rldmlj
ZV9nZXRfam9iX3RpbWVvdXRfc2V0dGluZ3MoYWRldik7Cj4gKwlpZiAocikgewo+ICsJCWRldl9l
cnIoYWRldi0+ZGV2LCAiaW52YWxpZCBsb2NrdXBfdGltZW91dCBwYXJhbWV0ZXIgc3ludGF4XG4i
KTsKPiArCQlyZXR1cm4gcjsKPiArCX0KPiArCgpJIGFzc3VtZSB0aGF0IHlvdSBtb3ZlIHRoZSBj
b2RlIGJlY2F1c2UgcHJldmlvdXNseSBTUklPVi9wYXNzdGhyb3VnaCAKc2V0dGluZyBpcyBub3Qg
YXZhaWxhYmxlIHlldD8KCkJ1dCBldmVuIHdpdGggdGhpcyBoZXJlIHlvdSBjYW4gc3RpbGwgcmVt
b3ZlIHRoZSBleHRyYSBTUklPViBjaGVjayBpbiAKYW1kZ3B1X2ZlbmNlLmMuCgpSZWdhcmRzLApD
aHJpc3RpYW4uCgo+ICAgCS8qIGRvb3JiZWxsIGJhciBtYXBwaW5nIGFuZCBkb29yYmVsbCBpbmRl
eCBpbml0Ki8KPiAgIAlhbWRncHVfZGV2aWNlX2Rvb3JiZWxsX2luaXQoYWRldik7Cj4gICAKPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rydi5jIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rydi5jCj4gaW5kZXggNDIwODg4ZS4uMTIz
NjI0NSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZHJ2
LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZHJ2LmMKPiBAQCAt
MTM3OCwxMCArMTM3OCwxMiBAQCBpbnQgYW1kZ3B1X2RldmljZV9nZXRfam9iX3RpbWVvdXRfc2V0
dGluZ3Moc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCj4gICAJCX0KPiAgIAkJLyoKPiAgIAkJ
ICogVGhlcmUgaXMgb25seSBvbmUgdmFsdWUgc3BlY2lmaWVkIGFuZAo+IC0JCSAqIGl0IHNob3Vs
ZCBhcHBseSB0byBhbGwgbm9uLWNvbXB1dGUgam9icy4KPiArCQkgKiBpdCBzaG91bGQgYXBwbHkg
dG8gYWxsIGpvYnMuCj4gICAJCSAqLwo+ICAgCQlpZiAoaW5kZXggPT0gMSkKPiAgIAkJCWFkZXYt
PnNkbWFfdGltZW91dCA9IGFkZXYtPnZpZGVvX3RpbWVvdXQgPSBhZGV2LT5nZnhfdGltZW91dDsK
PiArCQkJaWYgKGFtZGdwdV9zcmlvdl92ZihhZGV2KSB8fCBhbWRncHVfcGFzc3Rocm91Z2goYWRl
dikpCj4gKwkJCQlhZGV2LT5jb21wdXRlX3RpbWVvdXQgPSBhZGV2LT5nZnhfdGltZW91dDsKPiAg
IAl9Cj4gICAKPiAgIAlyZXR1cm4gcmV0OwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9hbWQtZ2Z4
