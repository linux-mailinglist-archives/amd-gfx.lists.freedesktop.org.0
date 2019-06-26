Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BC0E56A62
	for <lists+amd-gfx@lfdr.de>; Wed, 26 Jun 2019 15:26:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E5846E42C;
	Wed, 26 Jun 2019 13:26:44 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 264A36E42C
 for <amd-gfx@lists.freedesktop.org>; Wed, 26 Jun 2019 13:26:42 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id y198so1588240lfa.1
 for <amd-gfx@lists.freedesktop.org>; Wed, 26 Jun 2019 06:26:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0KQNsn2fCmYitiDv9gkNd7pWrAY8HVNXqrIMAFIYMEU=;
 b=kdhkJdfq30MjiUZFMGtGBymN8/NxeJIH8UDbaimJ3uK3u/WzUw+niMQUPkvPL0X/PZ
 r7/Nuy4P+OYTsSHuYTH3TAmGjjnX1vKLaoC0bOHF4uG8Q74JTdojzyaXJtiGsmoOnrTx
 Pa76uUtrbz4X/BtkA0DYVaEZuc7pmsRi4oUnttZiSaVqRZqF8t49IZjneRUF5aeYMnse
 RTtAvLVZK6P0FdzDQYr2RA7U3BiCUFkMFIDjW2EV4542HKEWonM10xYH8MAyasRb/ihs
 YIuQ/DPP8ZCxnWZmETW7UeI6ThnFvN4dnbxPZmVdss6xwIouBBJYNUoCnhaJauemNSJH
 AK5A==
X-Gm-Message-State: APjAAAWzT+uWEzhpDYbuJQsPY8pf18r+eqy+wQ8WhrexAQLbh6zA24rP
 tCfm7ojzebgvi+EvtWcTK3KjezkhjoA8c/jC5jGrJQ==
X-Google-Smtp-Source: APXvYqybuKo1OFuGMvZFtMATVhgvwQ0TaQVnkAkxGJ6JbLBBP+WfwR/5MF8aidBvBHtvBRNzwMnOhbAikP47ncpNnJ4=
X-Received: by 2002:ac2:495e:: with SMTP id o30mr2678993lfi.140.1561555600322; 
 Wed, 26 Jun 2019 06:26:40 -0700 (PDT)
MIME-Version: 1.0
References: <20190626132427.12615-1-colin.king@canonical.com>
In-Reply-To: <20190626132427.12615-1-colin.king@canonical.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Wed, 26 Jun 2019 14:25:34 +0100
Message-ID: <CAPj87rM9y5Zen5A5KkiCqqUF5m+vAwwtLj-iJrcwFfzMev+Mrw@mail.gmail.com>
Subject: Re: [PATCH][next[ drm/amd/display: fix a couple of spelling mistakes
To: Colin King <colin.king@canonical.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=0KQNsn2fCmYitiDv9gkNd7pWrAY8HVNXqrIMAFIYMEU=;
 b=NjgJOZQI/OY7TPBgoHm3D6Ry2QJNB0nWXc0QO3Y/AkulA6b6x+4s07J6po52HkDEYI
 9J/z9rxXHc8JWuQbQsoWS1T9uOphoAQrhpC0dfhmfm0UgaGuTeiOaJaD3mPn+hEaAvPi
 1gT+zh2HDcwd2D880J4ulsETR5gWrqkvu5b5ufYiWntVh9jp8BN2fTnpAQZJW5cJBnDR
 zxujoB0IlUBTZgJ1Zg4DctC6+uuN1b4IxwlDSrI1Roeq3t2hdUendNPOgFMnQynDC9Nm
 4rTSCrqxrqWiCQV7Zse2njjzpojDiJ7nxY5eRW+cmjAv/5nnnPheoK1E2NENiZtEt68s
 l7kg==
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
Cc: David Zhou <David1.Zhou@amd.com>, Leo Li <sunpeng.li@amd.com>,
 kernel-janitors@vger.kernel.org, Wenjing Liu <Wenjing.Liu@amd.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>,
 Nikola Cornij <nikola.cornij@amd.com>, David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>, Daniel Vetter <daniel@ffwll.ch>,
 Alex Deucher <alexander.deucher@amd.com>,
 Harry Wentland <harry.wentland@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

SGkgQ29saW4sCgpPbiBXZWQsIDI2IEp1biAyMDE5IGF0IDE0OjI0LCBDb2xpbiBLaW5nIDxjb2xp
bi5raW5nQGNhbm9uaWNhbC5jb20+IHdyb3RlOgo+IFRoZXJlIGFyZSBhIGNvdXBsZSBvZiBzcGVs
bGluZyBtaXN0YWtlcyBpbiBkbV9lcnJvciBtZXNzYWdlcyBhbmQKPiBhIGNvbW1lbnQuIEZpeCB0
aGVzZS4KCldoaWxzdCB0aGVyZSwgeW91IG1pZ2h0IGZpeCB0aGUgJ1tuZXh0WycgdHlwbyBpbiB0
aGUgY29tbWl0IG1lc3NhZ2UuCgpDaGVlcnMsCkRhbmllbApfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2FtZC1nZng=
