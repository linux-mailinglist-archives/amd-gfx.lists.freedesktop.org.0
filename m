Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 009B638797F
	for <lists+amd-gfx@lfdr.de>; Tue, 18 May 2021 15:05:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6292E6EB60;
	Tue, 18 May 2021 13:05:23 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDB456EB60
 for <amd-gfx@lists.freedesktop.org>; Tue, 18 May 2021 13:05:21 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id t15so11022312edr.11
 for <amd-gfx@lists.freedesktop.org>; Tue, 18 May 2021 06:05:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=o03w9VnytjXk27z8RMFQMIS0GeO4jFn0r6IV29Mqrik=;
 b=bbLpvFsCMasTaVqd/V/699pYE8h4hGVeV/Og1N/ODLCGMKzp6nnZjs8CNcDpgrkEEa
 vTbT0OUZ0kpB/FoedmD5dA5AjGqLz73Qlk+e+r47f6Cpd9dUTDAACQRmPLb6f0/bsxHt
 3YzjR5K4PISOwgLB2ZPQWarqVIiyIyKaX7w3JEHiB6J4JbI/YMiDgnQwuyVcWNysent8
 V5BxlwDGUzU4HHBYas3IgBbAsRffbq9DmZgcjxvzs+vd2IqVm/UkbctTRPhdRvtg7koL
 qFgELDtOxkENvD7mAMDXuNIMTyCsjoTolZuF29X3iBEnUz1f4xpdOMUPWriXefquLH9D
 fiRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=o03w9VnytjXk27z8RMFQMIS0GeO4jFn0r6IV29Mqrik=;
 b=KDl66XGU2o2Rnt78jIcR83YhbISaqrOb3Ca8mi8jvIH8Sj5Livrl9vEdSAfVhWIer4
 Ei/+E9/sU/btSoRtjvgsGQMhLEmcnNsEQiGrb1052PAaxdcGIjp6GbqEvbhnVPp9vRmG
 ExitMmVdRrDDwV7l9QC0le1HIyHdcraZWVda5bxe1qXPCRnjt93S3UKRfzA3ftEmT7h8
 UI3LEAJ1ZB3fLVuExICjUdWghLiSnCKmS9aKappeAbgN7x5pRF+QStLBTyT5oXDYlcQC
 hjaTZmMsDbwK66/NpVY8i9qemxY6ksaY7JBSvlr2BwrpSOuuZyhZVS7eKdqmVkrBtqSK
 e6/w==
X-Gm-Message-State: AOAM5338JT6Hr3yLeCUvU0rL9Plpyap3UBgsr2fHZC5AGgYIHpHyaCk5
 Y1Iv6kCVHmtF9MtWGgq4scZiB8+FUJI=
X-Google-Smtp-Source: ABdhPJwpT8uV7XvdRAlE9HBb08gT6N1SahPAxzQ/egSeKhON6IZG21NkjWnifNi7S81NfYj+93MCLw==
X-Received: by 2002:a50:c352:: with SMTP id q18mr7186160edb.30.1621343120655; 
 Tue, 18 May 2021 06:05:20 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:8470:36a5:2010:f0c4?
 ([2a02:908:1252:fb60:8470:36a5:2010:f0c4])
 by smtp.gmail.com with ESMTPSA id k22sm10158184eja.33.2021.05.18.06.05.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 May 2021 06:05:20 -0700 (PDT)
Subject: Re: [PATCH] drm/amdgpu: add cancel_delayed_work_sync before power gate
To: James Zhu <James.Zhu@amd.com>, amd-gfx@lists.freedesktop.org
References: <1621284148-24512-1-git-send-email-James.Zhu@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <96d3fb4b-d008-6948-0a93-0b510a6b25af@gmail.com>
Date: Tue, 18 May 2021 15:05:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <1621284148-24512-1-git-send-email-James.Zhu@amd.com>
Content-Language: en-US
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
Cc: jamesz@amd.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QW0gMTcuMDUuMjEgdW0gMjI6NDIgc2NocmllYiBKYW1lcyBaaHU6Cj4gQWRkIGNhbmNlbF9kZWxh
eWVkX3dvcmtfc3luYyBiZWZvcmUgc2V0IHBvd2VyIGdhdGluZyBzdGF0ZQo+IHRvIGF2b2lkIHJh
Y2UgY29uZGl0aW9uIGlzc3VlIHdoZW4gcG93ZXIgZ2F0aW5nLgoKU291bmRzIGxvZ2ljYWwgdG8g
bWUsIGJ1dCBMZW8gbmVlZHMgdG8gdGFrZSBhIGxvb2sgYXMgd2VsbC4KCkFja2VkLWJ5OiBDaHJp
c3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cgo+Cj4gU2lnbmVkLW9mZi1i
eTogSmFtZXMgWmh1IDxKYW1lcy5aaHVAYW1kLmNvbT4KPiAtLS0KPiAgIGRyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L3Zjbl92M18wLmMgfCAxOSArKysrKysrKysrKysrLS0tLS0tCj4gICAxIGZp
bGUgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS92Y25fdjNfMC5jIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvdmNuX3YzXzAuYwo+IGluZGV4IDc3OWU1ODUuLjM2MGRmZjIgMTAwNjQ0
Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdmNuX3YzXzAuYwo+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3Zjbl92M18wLmMKPiBAQCAtMzg4LDYgKzM4OCwxOSBA
QCBzdGF0aWMgaW50IHZjbl92M18wX2h3X2Zpbmkodm9pZCAqaGFuZGxlKQo+ICAgCQkJY29udGlu
dWU7Cj4gICAKPiAgIAkJcmluZyA9ICZhZGV2LT52Y24uaW5zdFtpXS5yaW5nX2RlYzsKPiArCQly
aW5nLT5zY2hlZC5yZWFkeSA9IGZhbHNlOwo+ICsKPiArCQlmb3IgKGogPSAwOyBqIDwgYWRldi0+
dmNuLm51bV9lbmNfcmluZ3M7ICsraikgewo+ICsJCQlyaW5nID0gJmFkZXYtPnZjbi5pbnN0W2ld
LnJpbmdfZW5jW2pdOwo+ICsJCQlyaW5nLT5zY2hlZC5yZWFkeSA9IGZhbHNlOwo+ICsJCX0KPiAr
CX0KPiArCj4gKwljYW5jZWxfZGVsYXllZF93b3JrX3N5bmMoJmFkZXYtPnZjbi5pZGxlX3dvcmsp
Owo+ICsKPiArCWZvciAoaSA9IDA7IGkgPCBhZGV2LT52Y24ubnVtX3Zjbl9pbnN0OyArK2kpIHsK
PiArCQlpZiAoYWRldi0+dmNuLmhhcnZlc3RfY29uZmlnICYgKDEgPDwgaSkpCj4gKwkJCWNvbnRp
bnVlOwo+ICAgCj4gICAJCWlmICghYW1kZ3B1X3NyaW92X3ZmKGFkZXYpKSB7Cj4gICAJCQlpZiAo
KGFkZXYtPnBnX2ZsYWdzICYgQU1EX1BHX1NVUFBPUlRfVkNOX0RQRykgfHwKPiBAQCAtMzk2LDEy
ICs0MDksNiBAQCBzdGF0aWMgaW50IHZjbl92M18wX2h3X2Zpbmkodm9pZCAqaGFuZGxlKQo+ICAg
CQkJCXZjbl92M18wX3NldF9wb3dlcmdhdGluZ19zdGF0ZShhZGV2LCBBTURfUEdfU1RBVEVfR0FU
RSk7Cj4gICAJCQl9Cj4gICAJCX0KPiAtCQlyaW5nLT5zY2hlZC5yZWFkeSA9IGZhbHNlOwo+IC0K
PiAtCQlmb3IgKGogPSAwOyBqIDwgYWRldi0+dmNuLm51bV9lbmNfcmluZ3M7ICsraikgewo+IC0J
CQlyaW5nID0gJmFkZXYtPnZjbi5pbnN0W2ldLnJpbmdfZW5jW2pdOwo+IC0JCQlyaW5nLT5zY2hl
ZC5yZWFkeSA9IGZhbHNlOwo+IC0JCX0KPiAgIAl9Cj4gICAKPiAgIAlyZXR1cm4gMDsKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGlu
ZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeAo=
