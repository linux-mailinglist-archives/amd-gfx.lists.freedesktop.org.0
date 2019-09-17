Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 69693B48B7
	for <lists+amd-gfx@lfdr.de>; Tue, 17 Sep 2019 10:03:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA6E76EB31;
	Tue, 17 Sep 2019 08:03:37 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D83086EB31
 for <amd-gfx@lists.freedesktop.org>; Tue, 17 Sep 2019 08:03:35 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id r17so1800625wme.0
 for <amd-gfx@lists.freedesktop.org>; Tue, 17 Sep 2019 01:03:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=sKdorh0+cRYKT/XhPE+XVcsVFpPCcMqxjaPQFk9HUe8=;
 b=rlOsg249NbRCnXfPYWm2wyvWIb0mtUVLFJJg+bvihFGjqiUHz+31i2eNRzi9fRpKNn
 rYXz5nRhrVGliD6nsSnQ2zPxvHWAuDi4QuSS8Ev56x11NevpTY4u1a97hWW01CKwLuP9
 qXbaFdxM64LisxOL0sNACsqgVyk5WJKrjZwNYRA5anO1L6oAMcTMd4n2F/Ri29VXjKFj
 RB1tqMkPHgy1rTSZrk/H4sDVli6v4M9GWQ+ac/qTbuDx/Vz8ycwMcQcbwNLoc8YweP0l
 uQWPWQg8A97ayb9RCVNHSOYvwmT+yNTLqd3yn+eSb0by9Tiqmd9ZRJqVaRFTxKdC0IGS
 B1DA==
X-Gm-Message-State: APjAAAW1PUX5goqQ8MZvwXpEk45ftiMqq98ZDqfXJNWJPM3wcrWKXjs2
 s8FDzyyVjYWkt0r7JSFCfaE=
X-Google-Smtp-Source: APXvYqz28+bOp8to9xXJzQEf3QU/dc8tcJrTPoQpnWDnzM3luchT5mveKgDF1mdKIQhNB8iR3E+zkg==
X-Received: by 2002:a1c:a617:: with SMTP id p23mr2338697wme.166.1568707414487; 
 Tue, 17 Sep 2019 01:03:34 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id f8sm1440792wmb.37.2019.09.17.01.03.33
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 17 Sep 2019 01:03:33 -0700 (PDT)
Subject: Re: [PATCH 1/2] drm/amdgpu: initialize bo in ras_reserve_bad_pages
To: "Zhou1, Tao" <Tao.Zhou1@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "Chen, Guchun" <Guchun.Chen@amd.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>,
 "Zhang, Hawking" <Hawking.Zhang@amd.com>
References: <20190917061643.29367-1-tao.zhou1@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <a33e79a2-d269-6fe2-a564-f71c637a459a@gmail.com>
Date: Tue, 17 Sep 2019 10:03:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190917061643.29367-1-tao.zhou1@amd.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=sKdorh0+cRYKT/XhPE+XVcsVFpPCcMqxjaPQFk9HUe8=;
 b=Aht5oXwpXzDUJtBH71VpvFucJrVcGP43TIoOslUKRZUM9Hb7B67B5iR+eBuSZToONn
 9WwGOLGG3ozMhxCc3EUYdZZ50Cqzlk+UHlHMMGPYzWyvXshVjBMQJVNz7nYcRdl4UMZ7
 SJFIVhH7tonxZDqPz2Yplat5PiS3qAbkAFHwaSxp3tOxRChPMimcKotilPgySWo4LGrf
 Q/SQNWDI8WxiMQLCFBD0b3XI+w8igXy6gWrtcKTJnED5DUHiMTHTbB6T/eCRERGIhnKY
 4ot8o+TKLdjbwKqwSAjdAL7Xe1NxDvK6IrKtyeuURKrmBow8Hik330eTFQiXAH9ORfpR
 xEZQ==
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

QW0gMTcuMDkuMTkgdW0gMDg6MTYgc2NocmllYiBaaG91MSwgVGFvOgo+IHRoZSBibyBwb2ludGVy
IGlzIHJldXNlZCBmb3IgYmFkIHBhZ2VzLCBpbml0aWFsaXplIGl0IGluIGVhY2ggbG9vcAo+Cj4g
U2lnbmVkLW9mZi1ieTogVGFvIFpob3UgPHRhby56aG91MUBhbWQuY29tPgoKUmV2aWV3ZWQtYnk6
IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4gZm9yIHRoZSBzZXJp
ZXMuCgo+IC0tLQo+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5jIHwg
MSArCj4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKPgo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzLmMgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfcmFzLmMKPiBpbmRleCA1ZjYyM2RhZjUwNzguLjA5MGRhZjU5NTQ2
OSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzLmMK
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzLmMKPiBAQCAtMTQy
MSw2ICsxNDIxLDcgQEAgaW50IGFtZGdwdV9yYXNfcmVzZXJ2ZV9iYWRfcGFnZXMoc3RydWN0IGFt
ZGdwdV9kZXZpY2UgKmFkZXYpCj4gICAKPiAgIAkJZGF0YS0+YnBzX2JvW2ldID0gYm87Cj4gICAJ
CWRhdGEtPmxhc3RfcmVzZXJ2ZWQgPSBpICsgMTsKPiArCQlibyA9IE5VTEw7Cj4gICAJfQo+ICAg
Cj4gICAJLyogY29udGludWUgdG8gc2F2ZSBiYWQgcGFnZXMgdG8gZWVwcm9tIGV2ZW4gcmVlc3J2
ZV92cmFtIGZhaWxzICovCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
