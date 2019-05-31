Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B2B8306EC
	for <lists+amd-gfx@lfdr.de>; Fri, 31 May 2019 05:13:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E9926E18F;
	Fri, 31 May 2019 03:13:54 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 789E16E18F
 for <amd-gfx@lists.freedesktop.org>; Fri, 31 May 2019 03:13:52 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id t64so5388074qkh.1
 for <amd-gfx@lists.freedesktop.org>; Thu, 30 May 2019 20:13:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fHkzIxIrxkSM/I3fdwHNLdqY//ixFUYECMEWBed0950=;
 b=JJUng+hF23zjKX7zKi46VGWG0IIrxPCpVfQ+LgTr1B0k3MwbyviIyUywb3E3Gpwklo
 dm2YzBWy7mrfibDuwT30jVil7oCL8MejdYJmzwFMCghJ22Yjg/Kg6x2JHBbUrQDlh+tj
 +YxuIra6zkQROwwYQT+gi1CdkTdJMSWhu1Q9Zsck2gJfKumg+BLJmMiQ/6fX7TRyn4wV
 fr9GRdzzybspRgLM5fNYqAATd/yOoLIkBxdFkekslh283dyz1d36aAf4d749fg2Fx4jH
 9lTTg3uVhJcBRAksVJUVwZHf6gv0YGvUpksuaJMWg2tdQquGcnikiTH12WZpBVOWkhug
 nbVw==
X-Gm-Message-State: APjAAAUV/Yny8Q6iWrh7yHFqw/e4BJMJg0Mf0jVDKqzSoxw9GZozVORZ
 S75llOzkZBcgnvPbOLtds1i/UlOkEk7mo/sRfHc=
X-Google-Smtp-Source: APXvYqzbx4b0/1WMh8FIcsSKqEAJnh1Q45p8H1tGj/Zt4GbKI+HcqKRXqCF1zMEwSfSbccMDC0tuTF784dyu58ya3Ug=
X-Received: by 2002:a37:8502:: with SMTP id h2mr6210618qkd.281.1559272431462; 
 Thu, 30 May 2019 20:13:51 -0700 (PDT)
MIME-Version: 1.0
References: <1558651263-3478-1-git-send-email-Oak.Zeng@amd.com>
 <1558651263-3478-6-git-send-email-Oak.Zeng@amd.com>
 <4f49af4d-0953-030c-bb1b-47b7a5fa7c7c@amd.com>
In-Reply-To: <4f49af4d-0953-030c-bb1b-47b7a5fa7c7c@amd.com>
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 31 May 2019 13:13:40 +1000
Message-ID: <CAPM=9tzs9adV7_ef4hpgswB-S==iQizAF_=FTarVm3EYwPCg0w@mail.gmail.com>
Subject: Re: [PATCH 6/8] drm/amdkfd: New IOCTL to allocate queue GWS
To: "Kuehling, Felix" <Felix.Kuehling@amd.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=fHkzIxIrxkSM/I3fdwHNLdqY//ixFUYECMEWBed0950=;
 b=T39de7Kjkr1OiXGZlBh4a4d+eSGlNs9Nidg8aPafWybygbJ9+31dm+d5XUUO+Z3AXf
 kiCfwSpDqGr1P4/u7KIt0n+k7IDoik+V/AFnSn8F/9/0oBvhxneUJwruMH4GOor2Ef/Q
 ilk1IKsvDcjoxs4UA7Cy+XgYkB0WeP0xmkxJDHavqPlrMzEZu9vpWvu5lknp07LBd98d
 ewnPr7uB73BUGzvZDsMspYdwFcnbl1UR7xCqbR1bOx3fkgvughTmSGO85IfQIeKvovkO
 zuLGR7vXHfPMavozqkNJ82Wgx3j+hTiFkZO0rDDgeUTatKt4Mc2n8sZXVGeE/YiQMySM
 olwQ==
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
Cc: "Zeng, Oak" <Oak.Zeng@amd.com>, "Keely, Sean" <Sean.Keely@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gU2F0LCAyNSBNYXkgMjAxOSBhdCAwNTo0OCwgS3VlaGxpbmcsIEZlbGl4IDxGZWxpeC5LdWVo
bGluZ0BhbWQuY29tPiB3cm90ZToKPgo+IE9uIDIwMTktMDUtMjMgNjo0MSBwLm0uLCBaZW5nLCBP
YWsgd3JvdGU6Cj4gPiBBZGQgYSBuZXcga2ZkIGlvY3RsIHRvIGFsbG9jYXRlIHF1ZXVlIEdXUy4g
UXVldWUKPiA+IEdXUyBpcyByZWxlYXNlZCBvbiBxdWV1ZSBkZXN0cm95Lgo+ID4KPiA+IENoYW5n
ZS1JZDogSTYwMTUzYzI2YTU3Nzk5MmFkODczZTQyOTJlNzU5ZTVjM2Q1YmJkMTUKPiA+IFNpZ25l
ZC1vZmYtYnk6IE9hayBaZW5nIDxPYWsuWmVuZ0BhbWQuY29tPgo+Cj4gUmV2aWV3ZWQtYnk6IEZl
bGl4IEt1ZWhsaW5nIDxGZWxpeC5LdWVobGluZ0BhbWQuY29tPgo+CgpidHcganVzdCBub3RpY2Vk
IGluIHBhc3Npbmcgd2UgYXJlIGFkZGluZyBuZXcgZmVhdHVyZXMgdG8ga2ZkLCBpcwp0aGVyZSBh
biBvcGVuIHNvdXJjZSBkZXZlbG9wZWQgdXNlcnNwYWNlIHRvIGdvIGFsb25nIHdpdGggdGhpcywg
dGhlcmUKbmVlZHMgdG8gYSBkZXYgYnJhbmNoIGluIHB1YmxpYyBiZWZvcmUgbmV3IGlvY3Rscy91
YXBpIHN1cmZhY2VzIHNob3VsZApiZSBhZGRlZCB0byB0aGUga2VybmVsLgoKVGhlIGNvbW1pdHMg
c2hvdWxkIHByb2JhYmx5IGhhdmUgcG9pbnRlcnMgdG8gdGhhdCBicmFuY2guCgpEYXZlLgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxp
bmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
