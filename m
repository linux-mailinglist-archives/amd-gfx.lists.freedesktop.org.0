Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C9AF57E301
	for <lists+amd-gfx@lfdr.de>; Thu,  1 Aug 2019 21:07:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 200836E78C;
	Thu,  1 Aug 2019 19:07:17 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B27236E78C
 for <amd-gfx@lists.freedesktop.org>; Thu,  1 Aug 2019 19:07:15 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id f9so74694975wre.12
 for <amd-gfx@lists.freedesktop.org>; Thu, 01 Aug 2019 12:07:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zFAYnpgWMmLImVnSmRa8yO3eNF7mHzdaGPiM3tD9Os0=;
 b=sGbXJ0peG+Q4tt+Om6ZF+UHKrhxzqgkXTx21ANkCDhnw2DHJUelTC4f4PUq8qXukaA
 j+VOXwaVP0L63bxLBTwSEdzrOUFFgZSKAjoLXYIf8fn+5rTc776DCGqKuPIR7UiJc63S
 EwRnPgR4h6JAGY6lVyE34gO9fRRUUCrjbK+HiZGaJfNTHbfOXoVWNFq56+tYNF+9IzQF
 8rFb+Ks2aFETkHrR8w8tpFqJ2zdkrzBDxgv++9U9qzBiojixw5IiLSoOgdaPj2r+gKvm
 newnXwqlrf0np+BL2P8/MTl+0U/1wYgqbFTH0ehnEosoj+bny5/JR2fdDnY2oKBk6cQ0
 ONTg==
X-Gm-Message-State: APjAAAUtZqZE8mEJMKzhdHNCX0vnP6ItysyWANY6ZkSigDl5XfWxIbtn
 Sg/jfzepJjj+bnu45BmwPIHJenPjbQd3aXx42fdnkw==
X-Google-Smtp-Source: APXvYqwlF0m1SBQo5SbE5Ekkq/IknzYrPa++1mUrSmlDgNYkVf0X1+ACv4hrxSyTOzE4tZrnjC2ujswesUtQ3mzx0ow=
X-Received: by 2002:a5d:6b11:: with SMTP id v17mr64721923wrw.323.1564686434102; 
 Thu, 01 Aug 2019 12:07:14 -0700 (PDT)
MIME-Version: 1.0
References: <20190801184741.20064-1-alexander.deucher@amd.com>
 <20190801184741.20064-2-alexander.deucher@amd.com>
 <98bcc2b1-43ae-4a7d-8220-90861d881c2e@www.fastmail.com>
In-Reply-To: <98bcc2b1-43ae-4a7d-8220-90861d881c2e@www.fastmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 1 Aug 2019 15:07:02 -0400
Message-ID: <CADnq5_OwkVn6y8p51g1dacG7fzw=uZ07o-VtPG24_YxeZKbNDg@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/amdkfd: Extend CU mask to 8 SEs (v2)
To: Jay Cornwall <jay@jcornwall.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=zFAYnpgWMmLImVnSmRa8yO3eNF7mHzdaGPiM3tD9Os0=;
 b=aCjvHCBFKRz/PvT1RNWW4JLfDlsaQDZI5Q9hYDoRLPtj4TxUysTHIwsh8RtVdooAVN
 BRUD3PFBYjN1iL7ZpBrEKR0gC2BCpEEnjcIYqn1gijOrXQ2rlsFWUrB4bM03lym4EPqn
 u1AWf9lgx9mbtA3rUj/Yu8EyQXIsl97EPSvXY+qgz51wiEXAKgavR8GnOuZPqmZKJJxx
 NR8gakc+x4XdOqQXekxmDwAE6q40NXoiFoGO7QmiYSQGLP/X1DQO579/TJH1eiy/sVwv
 sFUmKugTuL1YOwAN//sgq+NQDx7Mcj3aMlGUaDVp1zVSuTfydmjKo7RRJX3sDsFTO5ae
 VEOg==
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Jay Cornwall <Jay.Cornwall@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

V2hvb3BzLiAgRG9uZS4KCkFsZXgKCk9uIFRodSwgQXVnIDEsIDIwMTkgYXQgMzowMiBQTSBKYXkg
Q29ybndhbGwgPGpheUBqY29ybndhbGwuY29tPiB3cm90ZToKPgo+IE9uIFRodSwgQXVnIDEsIDIw
MTksIGF0IDEzOjQ3LCBBbGV4IERldWNoZXIgd3JvdGU6Cj4gPiBGcm9tOiBKYXkgQ29ybndhbGwg
PEpheS5Db3Jud2FsbEBhbWQuY29tPgo+ID4KPiA+IEZvbGxvd2luZyBiaXRtYXAgbGF5b3V0IGxv
Z2ljIGludHJvZHVjZWQgYnk6Cj4gPiAiZHJtL2FtZGdwdTogc3VwcG9ydCBnZXRfY3VfaW5mbyBm
b3IgQXJjdHVydXMiLgo+ID4KPiA+IHYyOiBzcXVhc2ggaW4gZml4dXAgZm9yIGdmeF92OV8wLmMg
KEFsZXgpCj4KPiBUaGVyZSdzIGEgc2Vjb25kIHBhdGNoIHRvIHNxdWFzaCwgd2hpY2ggZml4ZWQg
YnJlYWthZ2UgaGVyZSAoJSMgc3dhcHBlZCk6Cj4KPiA+IC0gICAgIHByX2RlYnVnKCJ1cGRhdGUg
Y3UgbWFzayB0byAlI3ggJSN4ICUjeCAlI3hcbiIsCj4gPiArICAgICBwcl9kZWJ1ZygidXBkYXRl
IGN1IG1hc2sgdG8gIyV4ICMleCAjJXggIyV4ICMleCAjJXggIyV4ICMleFxuIiwKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxp
c3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
