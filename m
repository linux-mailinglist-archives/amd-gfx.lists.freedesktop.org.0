Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A65712D7B3F
	for <lists+amd-gfx@lfdr.de>; Fri, 11 Dec 2020 17:47:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8E036E030;
	Fri, 11 Dec 2020 16:46:59 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DAF26E030
 for <amd-gfx@lists.freedesktop.org>; Fri, 11 Dec 2020 16:46:59 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id cw27so10037536edb.5
 for <amd-gfx@lists.freedesktop.org>; Fri, 11 Dec 2020 08:46:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=reply-to:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=VxoVgFzLbdhyTE4dB2RGZVMGFEa4V6eheU916zoUJ5o=;
 b=rwqsBmjAl1C5DPTZdhMyHgZqkPrLyq5y5d/qZN53wE0jnJfOB3o8vILxRMQFT7vKz0
 gBXNl0/sD3vW+WqN7605JfWvucuVD1Ng7jhRbDC7JWE+Q0xwAZ7tJ/57G5Nz85aJlkLG
 vtTn19qMFfYyvR7e4hbdyIEyO4EqyCNhr1NRvm7thHQ0lKeMFaujHbwVexAZ8554Vq17
 Lt+1Gr/Id+7HwfkeEl6454s6qOOX1MUqZ/cA3NoAGg4h1aOSm12fIucJIagFnG0uxe10
 XQBkfSHVXfvPrEkts2gHaQ6nNtUFr4gy1oMcItiIz5LFjkyGkld9kH3uQdJxmWFKT0NK
 K9LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=VxoVgFzLbdhyTE4dB2RGZVMGFEa4V6eheU916zoUJ5o=;
 b=dViab0pYER+TrehTuSy6IEjXFD4IxTqyNyOWKEGbs/PlKsG8GXXlf8xjjmBVGKwxl4
 di5GdDHseI89hcP+PQ+2bttc97fYQ6scIwwNPPNfEJLey0lT+Yd5Y9Vh2Vvlnj5iy2wR
 cDb915QSBt80BYYbJyUnhufI808sCCXOgVkqwcnyq5FCpSR5ygkCQxPFDDknOsrTV5XL
 cq0459Ifzyn69k6ljoCED3A3cBGT1hRGJ8/78nUWGIBC6T6IHmhFNX5/IpLxXujQ5gmj
 cQjxkx7xUBvGO0REZFTOd/kSWGbmuogPRVljGKMeW7qplptU0FiXNtRI7goroZV/7x5f
 GaoA==
X-Gm-Message-State: AOAM533qdeXDT+kdqkuSH91Ly34OQnPdK9B+GVgvk/WcDqNihkMLCyoL
 hR3POp/6qmWbG0CC+JyAkxKzyX5ASww=
X-Google-Smtp-Source: ABdhPJxB6gSYQ9v80kch/i0+6rPaar/9x0iZwKyp2bEZkC4BpdoGazIGFglM0ERKp5/jQYv8dAmYWA==
X-Received: by 2002:a50:c19a:: with SMTP id m26mr12654922edf.302.1607705217737; 
 Fri, 11 Dec 2020 08:46:57 -0800 (PST)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id z9sm7256809eju.123.2020.12.11.08.46.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Dec 2020 08:46:56 -0800 (PST)
Subject: Re: [PATCH] amdgpu: resize BAR0 to the maximum available size, even
 if it doesn't cover VRAM
To: christian.koenig@amd.com, amd-gfx@lists.freedesktop.org,
 Darren Salt <devspam@moreofthesa.me.uk>
References: <20201210005744.5877-1-devspam@moreofthesa.me.uk>
 <621ae252-ab39-383e-61a9-746fb47c6e01@gmail.com>
 <58E21FF244%devspam@moreofthesa.me.uk>
 <9d3cee7f-366e-4e7e-9f63-b0a51af7436c@gmail.com>
 <58E26045D8%devspam@moreofthesa.me.uk>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <77805324-8fdc-8d72-f033-7d75ae04947e@gmail.com>
Date: Fri, 11 Dec 2020 17:46:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <58E26045D8%devspam@moreofthesa.me.uk>
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
Reply-To: christian.koenig@amd.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QW0gMTEuMTIuMjAgdW0gMDI6NDIgc2NocmllYiBEYXJyZW4gU2FsdDoKPiBJIGRlbWFuZCB0aGF0
IENocmlzdGlhbiBLw7ZuaWcgbWF5IG9yIG1heSBub3QgaGF2ZSB3cml0dGVuLi4uCgpbU05JUF0K
CldlbGwgSSBkaWQgd3JvdGUgdGhhdCA6KQoKPiBJIHVzZWQgZGQ6ICMgZGQgaWY9L3N5cy9rZXJu
ZWwvZGVidWcvZHJpLzAvYW1kZ3B1X3ZyYW0gYnM9MTA0ODU3NiAKPiBjb3VudD0xIHNraXA9NjEy
NyB8IGhleGR1bXAgLUMgfHRhaWwKClRoYXQgd29uJ3Qgd29yay4gYW1kZ3B1X3ZyYW0gdXNlcyBh
IE1NSU8gcmVnaXN0ZXIgcGFpciB0byBhY2Nlc3MgVlJBTSAKd2hpY2ggd29ya3MgZXZlbiB3aGVu
IGl0IGlzbid0IENQVSB2aXNpYmxlLgoKVGhpbmtpbmcgbW9yZSBhYm91dCBpdCB1bXIgd291bGQg
cHJvYmFibHkgdXNlIHRoaXMgYXMgd2VsbCwgc28gdGhhdCAKd29uJ3Qgd29yayBlaXRoZXIuCgpZ
b3UgY291bGQgdHJ5IHRvIHVzZSBkZCBvbiAvZGV2L21lbSB3aXRoIHRoZSBvZmZzZXQgb2YgdGhl
IEJBUi4KCj4gQW55d2F5IEkgYWdyZWUgdGhhdCBhIFBDSSBzdWJzeXN0ZW0gcXVpcmsgbWlnaHQg
YmUgYXBwcm9wcmlhdGVkLgoKSSdtIGdvaW5nIHRvIGRpc2N1c3MgQU1EIGludGVybmFsbHkgd2h5
IHlvdSBoYXZlIHN1Y2ggc3RyYW5nZSB2YWx1ZXMgaW4gCnRoZSBSQkFSIHJlZ2lzdGVycy4KPj4g
SnVzdCBzZW5kIHRoYXQgdG8gbWUgYXMgYSBjb21wbGV0ZSBhbmQgY2xlYW4gcGF0Y2hzZXQuIAo+
IERvbmUsIHRob3VnaCBvbmx5IHRvIHRoZSBsaXN0LiAKCkkgaGF2ZSBhIGZldyBjb21tZW50cyBv
biB0aGUgcGF0Y2hlcy4gVGhleSBjYW4gdXNlIHNvbWUgcG9saXNoaW5nLCBidXQgCmluIGdlbmVy
YWwgdGhlIGFwcHJvYWNoIGxvb2tzIHNvbGlkIHRvIG1lLgoKUmVnYXJkcywKQ2hyaXN0aWFuLgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1h
aWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZngK
