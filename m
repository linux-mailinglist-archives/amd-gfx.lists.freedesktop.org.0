Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C545BDB6DC
	for <lists+amd-gfx@lfdr.de>; Thu, 17 Oct 2019 21:08:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 288986E487;
	Thu, 17 Oct 2019 19:08:20 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 545136EA1C
 for <amd-gfx@lists.freedesktop.org>; Thu, 17 Oct 2019 19:08:12 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id o18so3558640wrv.13
 for <amd-gfx@lists.freedesktop.org>; Thu, 17 Oct 2019 12:08:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LbD9EsA7xGcVl00OJvwA7LExiy43SqoZ5fKIl6PADUA=;
 b=mOdK39mgrRKZuo7kECWqD08sjUcYP0ydYDBEAg1XPsfU+PdcBVHv1S7GQFoPwVPCyS
 P2dCMWryzhuq1U/gM+o1dYjBFYNYceQGsiOfXjFp24oIR1twJBhFAU146LDAw6KvftUV
 +9VY6ESnnvaNItDBAYsoVcgAKje/4J6DUvBIxtYiEB6r2Ucg+Chs5HGkKIUKH+d22rLn
 4KySwagBati7IyX7SunPKf9BatgYPHILvxkUf9tK/aVcUehd7+wR40X9aezF/QPeoijB
 1PbH8RZjVU6/acjqFNeGnUI9OoEwUrmmbFoCkW6AdDB9S7PHn24+CEUCGI2ZczNWma2s
 rLXA==
X-Gm-Message-State: APjAAAXFZKwckVwuDLDpJ35GAs6DajMA9YwDGMx4at29Rg+k5XxIJHSm
 AT2HnwXvBETtsA/j/NqaEA4GP48qS4J+o/mnTsY=
X-Google-Smtp-Source: APXvYqzIM8o0VWdXCMjyh0M4cby7NkltvshOSKD0oEQTMMPXDQleMquAt7cnXp1zrGhsMPby6VG2e8+f0MA2NfbORts=
X-Received: by 2002:adf:ef0a:: with SMTP id e10mr4243798wro.234.1571339290816; 
 Thu, 17 Oct 2019 12:08:10 -0700 (PDT)
MIME-Version: 1.0
References: <CAHL+j0_2ir=8hHDoyqizweOUSV6XfqC-UCD15WuJ9vvptNLr0g@mail.gmail.com>
 <CADnq5_N0r8O2vQapGaary0L-OfdTdz-ezcMJK90+Gy2sPujYcw@mail.gmail.com>
 <CAHL+j08qsu1pSOZPLB9-XWw9ZmT2OamaWPBJV4T3Vzx_C8cD7g@mail.gmail.com>
 <67658520-b3f4-d2f9-7247-dd434ab5c30b@amd.com>
In-Reply-To: <67658520-b3f4-d2f9-7247-dd434ab5c30b@amd.com>
From: Sylvain Munaut <246tnt@gmail.com>
Date: Thu, 17 Oct 2019 21:08:30 +0200
Message-ID: <CAHL+j0-Nm+6VFXi_w4iciNdG40zubpqvh1RXs3MFfXJK2mFr0Q@mail.gmail.com>
Subject: Re: Spontaneous reboots when using RX 560
To: "Koenig, Christian" <Christian.Koenig@amd.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=LbD9EsA7xGcVl00OJvwA7LExiy43SqoZ5fKIl6PADUA=;
 b=Xhe9SL5SGn3y0LGX6HD3dGUAFImJXyTXt026AZ+oqjTGBTk/BS6gh2RDh+kM1hRtSD
 kSbGD4MQSwFyBHi4NYAieQ1KCbZVa+hjoAtl9jsu5tYeLzgqhoIs3b1+DnOiFTrPuko7
 lNoElnljHiRPZdmmdYd+xOKRQuXE7hzPgT/mh2F5rzr7/MUzeRGoC/mt2CL2zSLNIWXA
 S6FZUqVWpdLQSS10kiFmb0t62W2TfYXbJrDMeOaAaUXzty4nY+EEjHpqauj/iPX3aKPK
 /UTIhJgar2cztcS0vgSNGlQNRtJYq4hsaSFE12ij4e5Xm3nc7KCbpc3rhj8TZgyixRbF
 J8Gw==
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
Cc: Alex Deucher <alexdeucher@gmail.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

PiAgRnJvbSB0aGUgaGFyZHdhcmUgcG9pbnQgb2YgdmlldyB0aGUgb25seSB0aGluZyB3aGljaCBj
b21lcyB0byBtaW5kIGlzCj4gdGhhdCB5b3Ugc29tZWhvdyB0cmlnZ2VyZWQgdGhlIEVTRCBwcm90
ZWN0aW9uLgo+Cj4gSSBhc3N1bWUgeW91IGNhbiBydWxlIG91dCBhbiB1bnN0YWJsZSBwaHlzaWNh
bCBjb25uZWN0aW9uIChiZWNhdXNlIGl0Cj4gd29ya3Mgb24gd2luZG93cyksIHNvIHRoZSBvbmx5
IHRoaW5nIGxlZnQgaXMgdGhhdCB0aGVyZSBpcyBzb21ldGhpbmcKPiB2ZXJ5IHZlcnkgYmFkbHkg
Z29pbmcgd3Jvbmcgd2l0aCBwb3dlciBtYW5hZ2VtZW50Lgo+Cj4gSGF2ZSB5b3UgInR1bmVkIiB0
aGUgcG93ZXIgdGFibGVzIG9uIHRoZSBib2FyZCBzb21laG93PwoKTm9wZSwgbm90IGF0IGFsbC4K
CkluIHdpbmRvd3MsIEkgYWN0dWFsbHkgaGFkIG5vdGljZWQgdGhhdCBiZWZvcmUgSSBoYWQgaW5z
dGFsbGVkIHRoZQpBc3JvY2sgdXRpbGl0eSBmb3IgdGhlIGNhcmQsIGl0IHdhcyBzdGF5aW5nIGF0
IGl0cyBsb3dlc3QgY2xvY2suCkkgaGFkIHRoZSBSYWRlb24gLyBBTUQgZHJpdmVycyBpbnN0YWxs
ZWQgb2YgY291cnNlLCBidXQgbm90IHRoZSB2ZW5kb3IKdG9vbHMgZm9yIHRoZSBib2FyZC4gT25j
ZSBJIGluc3RhbGxlZCB0aGF0LCBpdCBzdGFydGVkIGF1dG9tYXRpY2FsbHkKZ29pbmcgdG8gaGln
aGVyIHBvd2VyIHN0YXRlIGFzIHRoZSBsb2FkIHZhcmllZC4gQW5kIGl0J3Mgc2V0IHRvIHRoZQoi
ZGVmYXVsdCIgcHJvZmlsZS4KCk9uIGxpbnV4IEkgaGF2ZW4ndCBkb25lIGFueXRoaW5nLiBKdXN0
IGEgZnJlc2ggVWJ1bnR1IDE5LjEwIGluc3RhbGwKd2l0aCBhbWRncHUgbG9hZGVkLiBOb3Qgc3Vy
ZSBpZiBJIGhhdmUgYW55dGhpbmcgZWxzZSB0byBkby4gSSdtIG5vdApldmVuIHN1cmUgaG93IHRv
IG1vbml0b3IgdGhlIGNhcmQgZnJlcXVlbmN5IC8gdm9sdGFnZSBvbiBsaW51eC4KCgo+IE9yIG1h
eWJlIG11bHRpcGxlIEdQVXMgY29ubmVjdGVkIHRvIHRoZSBzYW1lIHBvd2VyIHN1cHBseT8KClRo
YXQgbWFjaGluZSBoYXMgYW5vdGhlciBHUFUsIGEgTlZpZGlhIG9uZSBpbiB0aGUgZmlyc3QgeDE2
IHNsb3QuIFRoZQpOdmlkaWEgR1BVIGhhcyBhIFBDSWUgcG93ZXIgY29ubmVjdG9yIGdvaW5nIHRv
IGl0LgpUaGUgUlggNTYwIGJvYXJkICgKaHR0cHM6Ly93d3cuYXNyb2NrLmNvbS9HcmFwaGljcy1D
YXJkL0FNRC9QaGFudG9tJTIwR2FtaW5nJTIwUmFkZW9uJTIwUlg1NjAlMjAyRy8KKSBkb2Vzbid0
IGhhdmUgYW55IGFkZGl0aW9uYWwgUENJZSBwb3dlciBpbnB1dCwgc28gaXQgZ2V0cyBhbGwgaXRz
CnBvd2VyIGZyb20gdGhlIFBDSWUgc2xvdCBpdHNlbGYuCgpUaGUgUEMgaGFzIGEgNjUwVyBnb29k
IHF1YWxpdHkgQ29yc2FpciBwb3dlciBzdXBwbHksIGFuZCBkdXJpbmcgYWxsCnRoZXNlcyB0ZXN0
cyB0aGUgTlZpZGlhIEdQVSB3YXMgaWRsZSAobm90IGV2ZW4gYSB4c2VydmVyIGxhdW5jaGVkIG9u
Cml0IG9yIG5vdGhpbmcpLCBhbmQgdGhlIGZhbiBQU1UgZGlkbid0IGV2ZW4gc3BpbiB1cCAoaXQg
ZG9lc24ndCBzcGluCmlmIHBvd2VyIGlzIDwgMzUwIFcpLCBzbyBJIHRoaW5rIGl0IGhhcyBwbGVu
dHkgb2YgbWFyZ2luLgoKCkNoZWVycywKCiAgICBTeWx2YWluCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vYW1kLWdmeA==
