Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5890517D948
	for <lists+amd-gfx@lfdr.de>; Mon,  9 Mar 2020 07:30:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C50B89FC3;
	Mon,  9 Mar 2020 06:30:48 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com
 [IPv6:2607:f8b0:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B3C489FC3
 for <amd-gfx@lists.freedesktop.org>; Mon,  9 Mar 2020 06:30:47 +0000 (UTC)
Received: by mail-pg1-x52f.google.com with SMTP id m5so4259675pgg.0
 for <amd-gfx@lists.freedesktop.org>; Sun, 08 Mar 2020 23:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=iHG8I4pk1/0Ubpk4jyR2+lfDtrmJCY9wXZ7rGfuID34=;
 b=kR27snR1v0PDBGGd37HPLJNWZmbkB0dPHOw+FsDS1hDQB3+Zi8WExbBg01uePh2K2+
 melhHfM3cIBx5Gg/DftvU7yPxbK1H1bP02aQB8eWd0imPS+a4jaVmpvaLBfXYXP3f6R/
 iJa2ds/tSKau/r88f9Z6EL4NAxevIMoSxeEbvqqJ2GBAahjVXY21NzKOogArQumP3ohu
 jysyLTrPgHoKi5U9sFLR16/ozMpB4hXTx36vJgv7cVzSKFsB37uDOeW0fSqUKE2AbuUx
 /8TUV220zCPxjg+/JKFj5OjVAPWwd0kQwAiQWcaMfjw9veeFvRkrA61wkeQPbWUWKVOi
 AwXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=iHG8I4pk1/0Ubpk4jyR2+lfDtrmJCY9wXZ7rGfuID34=;
 b=SwPI9wvj8IgKd0ifnfxz5eP3qFb8wamV9rZXINDOkbK8PhiOk6/uYOI9rCscwTx6B2
 KlzM2xqsSjHNVOhq9AiE6fM7Yjw08fywJ4R1T43JuWSGqw+7b5IXZznJza/mQeaVgt05
 ELFNwdVpdSvz+xc2tSOMKTQmiVJn3BPKTtKaoAWQknNFaSgmGsWYveVvhkWnkW8f/Ebm
 vD5y+YpnpnKKiNyybLeZwkFdJI24b1A1NRd7rbNcVnF6ufUC41B9A8/lnv0XOut/Lw+9
 SIlTK403+jcsvFpry2M8v++CoS3qoxVA+b0JAQ7u+YWNbUVVJr9m3z52s2En+UxRwt7x
 weyw==
X-Gm-Message-State: ANhLgQ2RaxSvBeHDLHQqm3/fJY0AtNRF6iSIjoBmGTzXcDIOIsGSdmuU
 MrUjq0cfeSo+F4ZIhVXmQ257fXHDc7N44+R0PCU=
X-Google-Smtp-Source: ADFU+vv0QSZUBNaHnpKOLDBPwT4iTFwKoc6pZA7YPrg/7CNrUhhqGHRZr185E6gC4bd/P6wKKT1XqSfBxDfczErJsxc=
X-Received: by 2002:aa7:83c7:: with SMTP id j7mr15334642pfn.228.1583735446473; 
 Sun, 08 Mar 2020 23:30:46 -0700 (PDT)
MIME-Version: 1.0
References: <CAFvQSYQqneGVka+uyZjs1RsFNFkXZqYmz9pTP6=8uhUP0ddHAQ@mail.gmail.com>
 <DM6PR12MB30977EA10F8FDF64778C18CAE8E10@DM6PR12MB3097.namprd12.prod.outlook.com>
 <DM6PR12MB309791830A01031827FE2DCAE8E10@DM6PR12MB3097.namprd12.prod.outlook.com>
In-Reply-To: <DM6PR12MB309791830A01031827FE2DCAE8E10@DM6PR12MB3097.namprd12.prod.outlook.com>
From: Clemens Eisserer <linuxhippy@gmail.com>
Date: Mon, 9 Mar 2020 07:30:34 +0100
Message-ID: <CAFvQSYTm0ivSvTrFGUQ3S81+Q_SvbhZxaAQScOX3-kySWJPYUg@mail.gmail.com>
Subject: Re: Possibility of RX570 responsible for spontaneous reboots (MCE)
 with Ryzen 3700x?
To: "Bridgman, John" <John.Bridgman@amd.com>, amd-gfx@lists.freedesktop.org
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Hi John,

Thanks a lot for taking the time to look at this, even if it doesn't
seem to be GPU related at first.

> OK, that's a bit strange... I found mce log and MCE-Ryzen-Decoder as options for decoding.
Sorry for omitting that information - indeed I was using
MCE-Ryzen-Decoder, thanks for pointing to mcelog.
The mce log output definitivly makes more sense, I'll try to
experiment a bit with RAM.

Thanks also for the link to the forum, seems of all the affected users,
no one reported success in that thread.

> For something as simple as the GPU bus interface not responding to an access
> by the CPU I think you would get a different error (bus error) but not 100% sure about that.
>
> My first thought would be to see if your mobo BIOS has an option to force PCIE
> gen3 instead of 4 and see if that makes a difference. There are some amdgpu module parms
> related to PCIE as well but I'm not sure which ones to recommend.

I'll give it a try and have a look at the pcie options - but as far as
I know RX570 (polaris) should stay at PCI3 as far as I know.
Disabling IOMMU didn't help as far as I recall.

Thanks & best regards, Clemens
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
