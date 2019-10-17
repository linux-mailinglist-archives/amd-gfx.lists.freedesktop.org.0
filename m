Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D3791DB019
	for <lists+amd-gfx@lfdr.de>; Thu, 17 Oct 2019 16:29:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14ABB6E492;
	Thu, 17 Oct 2019 14:29:25 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1E1E6E492
 for <amd-gfx@lists.freedesktop.org>; Thu, 17 Oct 2019 14:29:22 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id l10so2203608wrb.2
 for <amd-gfx@lists.freedesktop.org>; Thu, 17 Oct 2019 07:29:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ALFBCtjxTOrtDbOzpAZHZO123QsjXRMPf0Oc3xZhyp8=;
 b=KwjgF//jmpTZDtiDkVHYY31EmG7u5BD1GBzXFzrLJdKDwXbTwr4U/VkKyxoQ9WCZ1K
 toVZPhAASA9nk5vS+0ejtGovpXDUfZNazyNL7p5ryTZxMuNUeQwuRFqKvh9ST6jBhoOQ
 eGU/NZhy51XJKv73GGENlax3DZDpz/j8drjEvzCD58v7bM604L0ADjHO0WuHVFwZNscf
 HLnGeT3ZIJVvJFQDdYoQNU/c0i9URI1uJiXUjfHZaEfkznutwXCfXkMumsV8GPTuWld/
 cFteoFYuMDD+VxioTLF8i7HrVDZEr70tCeJuC1XK+SvyncRkEAXrfvmqsbixLdxyCiOC
 CIGQ==
X-Gm-Message-State: APjAAAVcll6Q73U/mjuM2QL6Aeb7hUjSu3NWGSTRXoaapmbtzUEsxP04
 BIn1sa/1N3Gh64TODY0lYqIsMxQXoY+Q3uz/E7b9auS38eA=
X-Google-Smtp-Source: APXvYqxaEJixVgb4A00t/dJcx3xwagHzrSndS8upHZ81in2SPfKFyBW61zgxkDjgYfCnczzucQC73zMNfs8SRs/4mpM=
X-Received: by 2002:a5d:440b:: with SMTP id z11mr3162915wrq.309.1571322561192; 
 Thu, 17 Oct 2019 07:29:21 -0700 (PDT)
MIME-Version: 1.0
References: <CAHL+j0_2ir=8hHDoyqizweOUSV6XfqC-UCD15WuJ9vvptNLr0g@mail.gmail.com>
 <CADnq5_N0r8O2vQapGaary0L-OfdTdz-ezcMJK90+Gy2sPujYcw@mail.gmail.com>
In-Reply-To: <CADnq5_N0r8O2vQapGaary0L-OfdTdz-ezcMJK90+Gy2sPujYcw@mail.gmail.com>
From: Sylvain Munaut <246tnt@gmail.com>
Date: Thu, 17 Oct 2019 16:29:41 +0200
Message-ID: <CAHL+j08qsu1pSOZPLB9-XWw9ZmT2OamaWPBJV4T3Vzx_C8cD7g@mail.gmail.com>
Subject: Re: Spontaneous reboots when using RX 560
To: Alex Deucher <alexdeucher@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=ALFBCtjxTOrtDbOzpAZHZO123QsjXRMPf0Oc3xZhyp8=;
 b=X4JV3qmQNmWYIDaBbPobSFsTLGWo+98kAehZdsnP7xk63dZx5DSIJP+UU4KPQEsQQl
 GTKEn8x/KHS1jGnbTThNLOZFdOqFX4H4l/E/hiLNcFU8kIU0htXzDkKTAzU6VKhmbGWp
 /LIEtaLY0p5OjpP9IXRHtxTlBrcVIcLgwRblQyOa4h//0JxlbLaf7xbCG2LNvawkzc8V
 FLMLpUxMyBniBTOgNJu6rYnKkEDhrCA7R6LLpNoPE24KPPOKqZq7L+GUH12848pXLQpJ
 flZubpnbcIBF/coIfXWKFm17OgfummPmdWWcbg5VrfYfilcSlwOuaFIPl8Rs5GuGSHgd
 JeiA==
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
Cc: amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

SGksCgoKPiA+IEkgaGF2ZSBSWCA1NjAgMkcgY2FyZC4gSXQncyBwbHVnZ2VkIGludG8gYSAxNngg
cGh5c2ljYWwgLyA0eAo+ID4gZWxlY3RyaWNhbCBzbG90IG9mIGEgWDU3MCBjaGlwc2V0IG1vdGhl
cmJvYXJkIHdpdGggYSBSeXplbiAzNzAwWCBDUFUuCj4gPiBUaGUgaGFyZHdhcmUgd29ya3MgZmlu
ZSBhbmQgaXMgc3RhYmxlIHVuZGVyIFdpbmRvd3MgKHRlc3RlZCB3aXRoCj4gPiBnYW1lcywgYmVu
Y2htYXJrcywgc3RyZXNzLXRlc3RzLCAuLi4pCj4KPiBEb2VzIGJvb3Rpbmcgd2l0aCBwY2k9bm9h
dHMgb24gdGhlIGtlcm5lbCBjb21tYW5kIGxpbmUgaW4gZ3J1YiBmaXggdGhlIGlzc3VlPwoKSXQg
ZG9lc24ndCA6LwoKTWVzc2FnZSBpcyBzbGlnaHRseSBkaWZmZXJlbnQgYnV0IHNhbWUgaWRlYSA6
CgpbICAgODMuNzA0MDM1XSBhbWRncHUgMDAwMDowNjowMC4wOiBBTUQtVmk6IEV2ZW50IGxvZ2dl
ZApbSU9fUEFHRV9GQVVMVCBkb21haW49MHgwMDAwIGFkZHJlc3M9MHgwIGZsYWdzPTB4MDAyMF0K
WyAgIDg4LjczMjY4NV0gW2RybTphbWRncHVfZG1fY29tbWl0X3BsYW5lcy5jb25zdHByb3AuMCBb
YW1kZ3B1XV0KKkVSUk9SKiBXYWl0aW5nIGZvciBmZW5jZXMgdGltZWQgb3V0IG9yIGludGVycnVw
dGVkIQpbICAgOTIuMDc0Mzc5XSBpeGdiZSAwMDAwOjA0OjAwLjE6IEFkYXB0ZXIgcmVtb3ZlZApb
ICAgOTMuNDgwOTg5XSBpZ2IgMDAwMDowNzowMC4wIGVucDdzMDogUENJZSBsaW5rIGxvc3QKClNv
IGl0IHNjcmV3cyB1cCB0aGUgUENJZSB2ZXJ5IGJhZGx5IDovClNwZWNpZmljYWxseSBzZWVtcyB0
byBiZSBldmVyeXRoaW5nIGNvbm5lY3RlZCB0byB0aGUgWDU3MCBjaGlwc2V0LgoKQ2hlZXJzLAoK
ICAgIFN5bHZhaW4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
