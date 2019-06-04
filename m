Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 984993499E
	for <lists+amd-gfx@lfdr.de>; Tue,  4 Jun 2019 15:57:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E978B898F0;
	Tue,  4 Jun 2019 13:57:42 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA2B8898F0
 for <amd-gfx@lists.freedesktop.org>; Tue,  4 Jun 2019 13:57:40 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id 16so146373wmg.5
 for <amd-gfx@lists.freedesktop.org>; Tue, 04 Jun 2019 06:57:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=BkcVKeKa4inYbi4oCdbhwYoSqQQ5iO5VWSrIuTZ1ZQk=;
 b=qMO8jWUbg+usKBjmd0md5S9akQgVHgzL/DebHinTNMXRAi1+EjeYJBlD4lZoNOEuI5
 b29DHVUADwBcMf0SylXU3oxXi/ceucfWb5muhfwpwYoS6mtE/vwfdtJ5Mvu52PtjZ/SE
 avqeY+ESx4IW6L3PIS5LMitlD1GQhpN0LaZ5QfdgWIc6ry6u0rVxXo+66jou3sdALoms
 a/smrl8ojzUePtv0f69Q0GFu6l7wAKD4LDHrsXoG/BLckRmW6s/BHU+QBrej1BHTxb/I
 xvc1wCbxwt8cU/09AHt3dU17hWIOOP2I/9UmvyVB62joNFSmCSqCinzlGPx5DhUR5PB1
 eQdQ==
X-Gm-Message-State: APjAAAVa68HTqgtdNYDy4tOWJKDkCCkKOKglfl+LMG8IYw3to7fxm+1w
 yUwsImjx7Cyq3aWlSD8ZVnZWPWbc
X-Google-Smtp-Source: APXvYqzen66sBkaCcCE7tpiTfDZ3HE2HgYTRatMoy++NalwbfcAuppRpdwnjNZnCeTw1bOklKrPnWA==
X-Received: by 2002:a1c:a648:: with SMTP id p69mr6171235wme.155.1559656659497; 
 Tue, 04 Jun 2019 06:57:39 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id w3sm12597681wmc.8.2019.06.04.06.57.38
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 04 Jun 2019 06:57:38 -0700 (PDT)
Subject: Re: [PATCH] drm/amdgpu: no need fbcon under sriov
To: Yintian Tao <yttao@amd.com>, amd-gfx@lists.freedesktop.org
References: <1559655785-30379-1-git-send-email-yttao@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <1686be7b-ca1c-e43c-3906-e6131e8d25e1@gmail.com>
Date: Tue, 4 Jun 2019 15:57:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1559655785-30379-1-git-send-email-yttao@amd.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=BkcVKeKa4inYbi4oCdbhwYoSqQQ5iO5VWSrIuTZ1ZQk=;
 b=oh5JMch6oiARt183j3SPy8D98Mphmc/2JJfhnaqKpa9Q/v2WxiiJYlQSiIN1104u4I
 BN031PB/OY3OdLyNnkgpv7EsuiRSntFCVUFa3x/VXb9fnDtQfJY3Dpq7HPWIv3EdqMKr
 Yhi0Jbh9rri5RDIK9fBg+X7wQGBDdaLdwrjuthW79fDxPfPnJ1LQMaVF58cEeX8+1vg/
 FFM4znUc4Bk2oSAf0ZWhWnvNnPYm04gxGHgTuReIwGPgiCIZmZp48v/8/p132njuAtm/
 UplPOjHwBCgNDsw0aL7iB9P2SdkW14Sn51BaS56vNOltpLXBSIGCf2mVEXxbK+dZ5X3d
 4kCg==
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

QW0gMDQuMDYuMTkgdW0gMTU6NDMgc2NocmllYiBZaW50aWFuIFRhbzoKPiBVbmRlciBTcmlvdiwg
dGhlcmUgaXMgbm8gbmVlZCBvZiB0aGUgc3VwcG9ydCBmb3IgZmJjb24uCgpOQUssIHRoYXQgZXJy
b3IgbWVzc2FnZSBpcyBub3QgcmVsYXRlZCB0byBmYmNvbiBidXQgbWVhbnMgdGhhdCBQQ0llIApk
ZXZpY2UgcmVtb3ZhbCBpcyBub3Qgc3VwcG9ydGVkLgoKQ2hyaXN0aWFuLgoKPgo+IFNpZ25lZC1v
ZmYtYnk6IFlpbnRpYW4gVGFvIDx5dHRhb0BhbWQuY29tPgo+IC0tLQo+ICAgZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rydi5jIHwgMyArKy0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAy
IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZHJ2LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfZHJ2LmMKPiBpbmRleCAxZjM4ZDZmLi4yOGQwOTViIDEwMDY0NAo+IC0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kcnYuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kcnYuYwo+IEBAIC0xMDEyLDcgKzEwMTIsOCBAQCBhbWRn
cHVfcGNpX3JlbW92ZShzdHJ1Y3QgcGNpX2RldiAqcGRldikKPiAgIHsKPiAgIAlzdHJ1Y3QgZHJt
X2RldmljZSAqZGV2ID0gcGNpX2dldF9kcnZkYXRhKHBkZXYpOwo+ICAgCj4gLQlEUk1fRVJST1Io
IkRldmljZSByZW1vdmFsIGlzIGN1cnJlbnRseSBub3Qgc3VwcG9ydGVkIG91dHNpZGUgb2YgZmJj
b25cbiIpOwo+ICsJaWYgKCFhbWRncHVfc3Jpb3ZfdmYoYWRldikpCj4gKwkJRFJNX0VSUk9SKCJE
ZXZpY2UgcmVtb3ZhbCBpcyBjdXJyZW50bHkgbm90IHN1cHBvcnRlZCBvdXRzaWRlIG9mIGZiY29u
XG4iKTsKPiAgIAlkcm1fZGV2X3VucGx1ZyhkZXYpOwo+ICAgCWRybV9kZXZfcHV0KGRldik7Cj4g
ICAJcGNpX2Rpc2FibGVfZGV2aWNlKHBkZXYpOwoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9hbWQtZ2Z4
