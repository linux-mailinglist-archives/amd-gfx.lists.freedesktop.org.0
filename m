Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AA0252821F
	for <lists+amd-gfx@lfdr.de>; Thu, 23 May 2019 18:05:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 384DC89ECD;
	Thu, 23 May 2019 16:05:45 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCBF989ECD
 for <amd-gfx@lists.freedesktop.org>; Thu, 23 May 2019 16:05:43 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id i3so6418508wml.4
 for <amd-gfx@lists.freedesktop.org>; Thu, 23 May 2019 09:05:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VMMLTH1w+OI8mw4o1dlpcMXbtzLQjEtbnr/SywhmA7Q=;
 b=isummgtBdDVIS2Th0lLWu4rTJAS436sa4gmr10y+uqZsCiEaPPAlCsy7SM552g0ews
 BR3l4ljq7MwQXMRJicc+bLkDf++sSLkud/EvQ5+vbw5xLsGvpyriesz/c+L3MAHgUGl+
 f05iwnjQXQMUkHOST97XyVyqvv7AOCmB9AhDKjkxQ7k7gD+EconY2bh0sqUHPy94a+6Y
 Jwr3CfWXuuuikwWzJ7ovs5p9/iGlP8biTgaLmX3GJ8EcoVmPalyrswT/lrHtLgBgVPMt
 Dt0sk0grH1Oc/D/oS4gvTSVhJ2NGZKMetKAhYzjBhVHvl5lfYTAJTrhFeu6Pb+fqlyzT
 og+w==
X-Gm-Message-State: APjAAAXZgtwxJ8b8sH2OEGnQmxgNnKb8NaJBT5soSvUsgRDzpzsKGaG9
 3hTcRP45VuVtuDsyRFVXSvFcATKWHgszW+gxTkCZVg==
X-Google-Smtp-Source: APXvYqzPhlR5C9A6HR4inyB0WS7DiYZ9YAxpWaC6U0OmwUmL2wNzjwsMuk9rmdkMYqRWzRzvlAvSrP/bjD0e3N1gjxY=
X-Received: by 2002:a1c:f009:: with SMTP id a9mr11993123wmb.110.1558627542338; 
 Thu, 23 May 2019 09:05:42 -0700 (PDT)
MIME-Version: 1.0
References: <887af196-43f2-558c-452c-eb2e1d6b6ef6@fedoraproject.org>
In-Reply-To: <887af196-43f2-558c-452c-eb2e1d6b6ef6@fedoraproject.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 23 May 2019 12:05:31 -0400
Message-ID: <CADnq5_Pymv_eJODaCrxVmAHHg0TSZFreBg61XNJFLRczirUSYQ@mail.gmail.com>
Subject: Re: Quick question for the mobile Raven Ridge auto-rotate function
To: Luya Tshimbalanga <luya@fedoraproject.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=VMMLTH1w+OI8mw4o1dlpcMXbtzLQjEtbnr/SywhmA7Q=;
 b=VhS9ehLvhtQQKtz7QnyCxCz79/Z7kQmHalt5EuA/z981SkKKaUxWM9wNHsrX00/KCt
 slX9Ing20g5YgNeeLBpTxAJUfeBiuS0DNKle0XAhfpg0As9+Dei3s1TJKlhRs/TH5WgM
 bk0ptHd15HXzeVWGCpEVeZv47Kb57RKoN/LVXLbLwHHHNlNvd3CuR+wMqxc4whOg2yxM
 mSRHT/PB801aBCEQ3hy/s7fiQIPaAQ+/HJP2sHG2fim1QmXkpjE7q8DdpZ54qVhhmmMY
 AcJ+f9F87DJBQZfe4ou3gSDyM2/AAV7h/1KkX1QRdwfZLAMS9VeuifoFhNYVNR3C2s+a
 JQ/A==
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

T24gVGh1LCBNYXkgMjMsIDIwMTkgYXQgMTo0MSBBTSBMdXlhIFRzaGltYmFsYW5nYQo8bHV5YUBm
ZWRvcmFwcm9qZWN0Lm9yZz4gd3JvdGU6Cj4KPgo+IC0tLS0tQkVHSU4gUEdQIFNJR05FRCBNRVNT
QUdFLS0tLS0KPiBIYXNoOiBTSEEyNTYKPgo+IEhlbGxvIHRlYW0sCj4KPiBUaGFuayBmb3IgeW91
IG1ha2luZyBtb2JpbGUgUmF2ZW4gUmlkZ2UgbmVhcmx5IGZ1bGx5IGZ1bmN0aW9uYWwgd2l0aCB0
aGUKPiBvcGVuIHNvdXJjZSBkcml2ZXIgZm9yIG11bHRpcGxlIGRldmljZXMgbGlrZSBIUCBFbnZ5
IHgzNjAgUnl6ZW4gMjUwMHUuCj4gSG93ZXZlciwgbWlzc2luZyBpcyB0aGUgYWJpbGl0eSB0byBh
dXRvLXJvdGF0ZSB0aGUgc2NyZWVuIHdoZW4gc3dpdGNoaW5nCj4gZnJvbSBsYW5kc2NhcGUgdG8g
cG9ydHJhaXQgaW4gdGFibGV0IG1vZGUuCj4KPiBXaGljaCBjaGFubmVsIHdpbGwgYmUgYmV0dGVy
IHRvIHJlcXVlc3QgZW5hYmxpbmcgdGhhdCBmdW5jdGlvbiBpbiBvcGVuCj4gc291cmNlIGRyaXZl
cj8gU2VlIHRoZSByZWxhdGVkIGlzc3VlIGJlbG93Ogo+Cj4gUmVkIEhhdCBidWcgcmVwb3J0OiBo
dHRwczovL2J1Z3ppbGxhLnJlZGhhdC5jb20vc2hvd19idWcuY2dpP2lkPTE2NTE4ODYKPgo+IExp
bnV4IGtlcm5lbCByZXBvcnQ6IGh0dHBzOi8vYnVnemlsbGEua2VybmVsLm9yZy9zaG93X2J1Zy5j
Z2k/aWQ9MTk5NzE1Cj4KPiBJIHdpbGwgYmUgd2lsbGluZyB0byB0ZXN0IHN1Y2ggZHJpdmVyIHRv
IHJlcG9ydCB0aGUgZnVuY3Rpb25hbGl0eS4KPgoKT24gbW9zdCBwcm9ncmFtcyB0aGUgYWNjZWxl
cm9tZXRlcnMgd2VyZSBwcm92aWRlZCBieSB0aGUgT0VNIGFzIHBhcnQKb2YgdGhlaXIgcGxhdGZv
cm0gZGVzaWduLiAgSSdtIG5vdCBzdXJlIGhvdyBpdCB3b3JrcyBvbiBuZXdlcgpwcm9ncmFtcy4g
IEknbGwgYXNrIGFyb3VuZCBpbnRlcm5hbGx5LgoKQWxleAoKPgo+IFRoYW5rcyBpbiBhZHZhbmNl
LAo+Cj4gTHV5YSBUc2hpbWJhbGFuZ2EKPiBGZWRvcmEgRGVzaWduIFRlYW0KPgo+IC0tLS0tQkVH
SU4gUEdQIFNJR05BVFVSRS0tLS0tCj4KPiBpUUV6QkFFQkNBQWRGaUVFV3lCK0JRdFlpRno0R1VO
RFhsS0JkTmlpWUpvRkFsem1NTThBQ2drUVhsS0JkTmlpCj4gWUpxL3dBZ0FuOGpXaHpYTExiQllq
dGFpNGYwQzRydzFjS3QxTURpNDhxT3hsU2lQYU9wbGZHOFJMckNHVkZMMwo+IGpNZ1JlSGhOL1Uz
emZ5M1NSQlhhMnpzVHNwZFZLUm54ZXdNeEpISm1TNjUzcHJPQUVWc2ZkNDFiL1hETUlubXAKPiBr
RkNjVEtYd1I5R2xVWVBiU3VqM3BNTFN3cTNPSG1CbFBqbnBMNE5NWGxtcmNRNnBzTjlJOTkySXRn
OEhFb2gyCj4gM3ZHRjVxUmRLdWlkTG51OXhSTkxjZUxqdnB2VHlKNWZoSC9SeTVzeWxYNW9KaGRX
N1dsUjVIRStTbXNndTdoVwo+IHJWR2dHbDZ5RmRVRUdhaUZScWhQeHVFcEMwN2k3Vmk1UkVxQitz
L1lVZ3pNK1duODZ0YUE0TGQxUjlkTWVaSW0KPiBnN0VKZU84YzZSS0lJMk1PS1dyS3RUcHZ1VWcr
UlE9PQo+ID1GdGZnCj4gLS0tLS1FTkQgUEdQIFNJR05BVFVSRS0tLS0tCj4KPiBfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGFtZC1nZnggbWFpbGluZyBs
aXN0Cj4gYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZngKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9hbWQtZ2Z4
