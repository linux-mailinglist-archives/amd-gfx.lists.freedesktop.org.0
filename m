Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CA5A98B46D
	for <lists+amd-gfx@lfdr.de>; Tue, 13 Aug 2019 11:44:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E1E96E0D2;
	Tue, 13 Aug 2019 09:44:12 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF9906E0D2
 for <amd-gfx@lists.freedesktop.org>; Tue, 13 Aug 2019 09:44:10 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id b16so10424847wrq.9
 for <amd-gfx@lists.freedesktop.org>; Tue, 13 Aug 2019 02:44:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=tHMXxGw6fyQvklnUFzeykv+e0nKt/FW3vyzlspEkV4k=;
 b=dbwlZEN38K8tznZkLW17V97Zx/jhSal1t9fb47o31Htlavv+nrtB2spPaVCurowp2K
 vLZe9insiS7lbwrOGtE+sUTnCpfyi8aJQHWweXuIbqP5cjMn2nzwTIvInVk35UEPNWEI
 iV9jw4M/JGkZrdvk76sC8QFoOSVD/ZzMYLUto4OR3gsDzKJ4lRWbp8HAU+TreTEw4Yn6
 Gj8T/guG7H1cbmteKPiyAilfMMSLTKvXVztxr2+IGwUxR1k26J0zN1JvcasVruyGW42S
 I836jAet95Lt95q9rSnoRVsgJ0GxQAem/c8odFyzzzqYKFcnaimKcaHGCDwcp5+TmK7M
 QdNw==
X-Gm-Message-State: APjAAAVDVBz61GNgkJtKSopBjQ2r8QeEKYvzRl4H1+L1VuUxY6MJBM+T
 CF94piVdUdbHTxHkpXTgqPZGFNJO
X-Google-Smtp-Source: APXvYqxpyqc7+k+NdfO4sKoaTsQ8JJh+WVidO4OouM3GRY1VaMOQJ2hypDA5PYYWpDr/iDYpbmh9PA==
X-Received: by 2002:adf:8bd8:: with SMTP id w24mr20954921wra.273.1565689449127; 
 Tue, 13 Aug 2019 02:44:09 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id r5sm1402433wmh.35.2019.08.13.02.44.08
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 13 Aug 2019 02:44:08 -0700 (PDT)
Subject: Re: [PATCH 2/2] drm/amdgpu: use exiting
 amdgput_ctx_total_num_entities function
To: "Wang, Kevin(Yang)" <Kevin1.Wang@amd.com>,
 "dl.srdc_lnx_nv10" <dl.srdc_lnx_nv10@amd.com>
References: <20190813090745.9496-1-kevin1.wang@amd.com>
 <20190813090745.9496-2-kevin1.wang@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <b88ca84b-260e-9218-ec3d-f292ef1fb3fc@gmail.com>
Date: Tue, 13 Aug 2019 11:44:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190813090745.9496-2-kevin1.wang@amd.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=tHMXxGw6fyQvklnUFzeykv+e0nKt/FW3vyzlspEkV4k=;
 b=b22N7Ch0etefuVgyShS/uPVdL15VEumG/lqa0R337/w+R4WJGMNGmx2Kp9VKF/y68s
 T/KbtyN1DGQI0dhQfy2QULJg0LW9mGRxRdV6oAUJOqIzCkhxpM8U2HRaP7IBG/S4/NBu
 2oAXGbLRCNAH8LIHYeOdJAE2F84bbt2d2y/hkOsi9ZXN/wW6sau4zHPiL73X+8cmgJgm
 DFhmMXTac5JARM8E5k7Qihwo1kaowEtE4+YQ/0jV6H0g6F8jsUsoVuce8S/aeSPUaRAn
 LNF3hOpIfF1PmBUYG9hrmx+7Cd5vz/TpkHxOYJwUj07KG/gOXS/aZtJffKfaXvxUl3AH
 Pegg==
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
Cc: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QW0gMTMuMDguMTkgdW0gMTE6MDggc2NocmllYiBXYW5nLCBLZXZpbihZYW5nKToKPiBzaW1wbGlm
eSBkcml2ZXIgY29kZS4KPgo+IFNpZ25lZC1vZmYtYnk6IEtldmluIFdhbmcgPGtldmluMS53YW5n
QGFtZC5jb20+CgpSZXZpZXdlZC1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5p
Z0BhbWQuY29tPgoKPiAtLS0KPiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9j
dHguYyB8IDUgKy0tLS0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgNCBkZWxl
dGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfY3R4LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfY3R4LmMKPiBpbmRl
eCA5NWQ4MjAxYTczOGUuLjg5YzI2YmIwZjA1YyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfY3R4LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfY3R4LmMKPiBAQCAtMjkwLDEwICsyOTAsNyBAQCBzdGF0aWMgdm9pZCBhbWRn
cHVfY3R4X2RvX3JlbGVhc2Uoc3RydWN0IGtyZWYgKnJlZikKPiAgIAo+ICAgCWN0eCA9IGNvbnRh
aW5lcl9vZihyZWYsIHN0cnVjdCBhbWRncHVfY3R4LCByZWZjb3VudCk7Cj4gICAKPiAtCW51bV9l
bnRpdGllcyA9IDA7Cj4gLQlmb3IgKGkgPSAwOyBpIDwgQU1ER1BVX0hXX0lQX05VTTsgaSsrKQo+
IC0JCW51bV9lbnRpdGllcyArPSBhbWRncHVfY3R4X251bV9lbnRpdGllc1tpXTsKPiAtCj4gKwlu
dW1fZW50aXRpZXMgPSBhbWRncHVfY3R4X3RvdGFsX251bV9lbnRpdGllcygpOwo+ICAgCWZvciAo
aSA9IDA7IGkgPCBudW1fZW50aXRpZXM7IGkrKykKPiAgIAkJZHJtX3NjaGVkX2VudGl0eV9kZXN0
cm95KCZjdHgtPmVudGl0aWVzWzBdW2ldLmVudGl0eSk7Cj4gICAKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1n
ZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
