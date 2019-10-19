Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32291DD7AA
	for <lists+amd-gfx@lfdr.de>; Sat, 19 Oct 2019 11:37:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7203489C61;
	Sat, 19 Oct 2019 09:37:13 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 052CA89C61
 for <amd-gfx@lists.freedesktop.org>; Sat, 19 Oct 2019 09:37:12 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id 14so1605278wmu.0
 for <amd-gfx@lists.freedesktop.org>; Sat, 19 Oct 2019 02:37:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YfAiRWy3f+4PqUWpkt8nPnRc2J7ay117mRqo57Xr6NU=;
 b=uRFVAljHAanhqVRG6fgj3/c1M95btu/ZTAwyLwVzeL82yuSEzzNulhdJFvuG2gbEN5
 3eAMvs6B4jNjte8TmCQTTWL+xIz9H50oDSE5G4l6JQEbP0V80UjMYKlJ6oKQRiKA1iEq
 uqLZ6QxsAOxes8rT1LgMIzegEGbQWOzT1KlqUWOWlIh5uju9Una2BM+6adIdkAFw4skt
 O1SCxvwY8XHMUATCZa8wyC2uwHjzVct9lMr2iAyOxztug+7Lab2vMRYYaQnfqUvWL6ZM
 TIANKE0hL7rIre14hLPhRPsnVu3V5sRGXEsykY+sey53vl8sMJdcJHs2mek0mYbyGVTr
 FyWA==
X-Gm-Message-State: APjAAAUyRCcrc/3GGpMDaZ2mwPZYBrVntaslWOpt98fqLRA8mkJRNHgD
 GT7ARBuCfDs0RuTmno55tQJcMlTNZt7kbxxyG15Jn6m9
X-Google-Smtp-Source: APXvYqy5V0oziughv41RtTcgPvUXpVm1J2dt48vwE8JdXlscE9Ea24i48ZcVwdM1TM+FrqbRMVeVrzuA5kbbbxQv9aw=
X-Received: by 2002:a05:600c:3cb:: with SMTP id
 z11mr11371734wmd.138.1571477830436; 
 Sat, 19 Oct 2019 02:37:10 -0700 (PDT)
MIME-Version: 1.0
References: <CAHL+j0_2ir=8hHDoyqizweOUSV6XfqC-UCD15WuJ9vvptNLr0g@mail.gmail.com>
 <CADnq5_N0r8O2vQapGaary0L-OfdTdz-ezcMJK90+Gy2sPujYcw@mail.gmail.com>
 <CAHL+j08qsu1pSOZPLB9-XWw9ZmT2OamaWPBJV4T3Vzx_C8cD7g@mail.gmail.com>
 <67658520-b3f4-d2f9-7247-dd434ab5c30b@amd.com>
 <CAHL+j0-Nm+6VFXi_w4iciNdG40zubpqvh1RXs3MFfXJK2mFr0Q@mail.gmail.com>
 <CAHL+j0_=r1XBOzwiQmbZTVoRsZ5=Du3pAPd_n7pia81FegdHhw@mail.gmail.com>
 <57826a9e-5842-4ddd-a456-67d1d1b9a9ce@amd.com>
 <CAHL+j0-NJ8F4RpMJ5m9_9gk_t+zhwFwVmG6MMy4TBYa4XjnWEA@mail.gmail.com>
 <CADnq5_MTYe5z0gbtY0eCnUax2D=HZYBQF7YWPS86pikDXGVWOA@mail.gmail.com>
 <CAHL+j0_Dn9VZ7CN-yaaFP4kk39gWTKu4fLZ6SN4Dj17e2z+4RQ@mail.gmail.com>
In-Reply-To: <CAHL+j0_Dn9VZ7CN-yaaFP4kk39gWTKu4fLZ6SN4Dj17e2z+4RQ@mail.gmail.com>
From: Sylvain Munaut <246tnt@gmail.com>
Date: Sat, 19 Oct 2019 11:37:31 +0200
Message-ID: <CAHL+j08BgqmOoQHnsfE3xtZFsz14cOZ=Xui3o7mENJd3Fq0z0g@mail.gmail.com>
Subject: Re: Spontaneous reboots when using RX 560
To: Alex Deucher <alexdeucher@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=YfAiRWy3f+4PqUWpkt8nPnRc2J7ay117mRqo57Xr6NU=;
 b=PRSAwSjv3mXx0UVFMZ1mRqEqTKwp+SuX1muhawRnkCSjRjSn4WEBniSFuPLd34/waW
 nzXpELHTNchKX/+DJvtuvd9Ja3F/eQm4PYzGQgq7C9IiWQ1IPGIa6V8CTv4QP4HAI7MR
 d5rzReAzWWkWZvYTlLG9B9XzgKH+TZViqgPHgGbMaaBQB6719f91gGh0Kd/oa+6X9oMI
 hDbAGvGs7DU3kopaf7Qt4twKtg2RbhVUisjX6jAz59Caf6szumRgwH5bQzdgp1g78hbV
 Y0iF5aEcTxvniVcoY/U0Ksr8W6JWP+oUd7xo3AsTBGn3xGxB+Ef+fHB0I70o1+1cvrpV
 Xzqg==
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
Cc: "Koenig, Christian" <Christian.Koenig@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

SnVzdCBpbiBjYXNlIHRoZXJlIHdhcyBhbnkgZG91YnQsIHNlZW1zIE9wZW5DTCB3b3JrbG9hZCBj
cmFzaGVzIHRoZQpjYXJkIGp1c3QgYXMgaGFyZC4KKFRoYXQgd2FzIHRoZSBBTURHUFUtUHJvIE9w
ZW5DTCBsaWIsIGxlZ2FjeSB2ZXJzaW9uLiAgQ2FuJ3QgZ2V0IFBBTCB0bwpkZXRlY3QgdGhlIGNh
cmQgYXQgYWxsKQoKQ2hlZXJzLAoKICAgICBTeWx2YWluCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vYW1kLWdmeA==
