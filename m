Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 43D641D9FE5
	for <lists+amd-gfx@lfdr.de>; Tue, 19 May 2020 20:45:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 318196E453;
	Tue, 19 May 2020 18:45:44 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com
 [IPv6:2607:f8b0:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 690D06E453
 for <amd-gfx@lists.freedesktop.org>; Tue, 19 May 2020 18:45:43 +0000 (UTC)
Received: by mail-oi1-x236.google.com with SMTP id l6so642047oic.9
 for <amd-gfx@lists.freedesktop.org>; Tue, 19 May 2020 11:45:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=k3FC/20Mj5OPsflmNW3rWXC8fBeDPR0+/vOg2n8J8Kg=;
 b=QzhBZqaSo132xKC2AQ68oK2mvwNUvQUb4ChovKPJXaA/f+Zxzexv1Btab8WnHmyFu0
 EuXYmg8QHDnHsp4skYsjYWKHrBh+PrQ2KJitoxQMOH8a8t9UAtSgnrwdDKUwp2nuYbeb
 Ge+qEZvi/S2CrmWocKgLEN+7yxA7Qj+T8zHxS5wUe1W5kvVaxaq5JntsKRGdRyWHTeEL
 cqUpnCC/nJArGfdBqxLW4G9Pd6+3FtNqXdBU+DKxCPN8YjoCQMLZXhc49VqqV/LWcHh+
 a1FIZoTHn35XzlOldbBIihtCzKJfTQs2XVAe9X/y13MsgdlxJQaNMqorBH8sUM1i6r24
 TRdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=k3FC/20Mj5OPsflmNW3rWXC8fBeDPR0+/vOg2n8J8Kg=;
 b=IgKnVgyomxjrta0wjbQ+4aHqHUg+/qsZlPT5PsVv0NCyHsqWl47K+liiNxBJcWuFUh
 vtZD5k3jNRgoP0YBTelficLmfzy69sLHi4oCsfDqT0+z/49M/SWGxoVkX/I4UmSgVS6G
 WUGE2n2jZu/2m1tGwDwcSJlemjq4G3nPUJjKrOA3kYG96tgVEwiATSDENUZnw52I8E6x
 +x3d550QOFfBsKzJhQJRuAwI7Xg1FsHRiXlRvcRCSNpFBs12dXE9vUkiA8nLFhgcYSQS
 4c+UZBJWGYBvNCuT6jJNoxANsuvy00XO0bg82P7uNzRX23oJecJJ7PyJcenKzsRbxIzh
 E5eA==
X-Gm-Message-State: AOAM530Hner3rT/WaIWxiONM5MASrEe5VdhNjSBhGi73uWmUvbIgk3Ju
 9+cKedYCpU/93tZmnQOnOv1vtLZzbPWJyuMuXyRzbAthKas=
X-Google-Smtp-Source: ABdhPJy+SSSnrTZGQd2VWclE6SeSzO+4ERYukWrkll2UOsg7Y0b5/dN3pYQd59o/AvxVqxcXYtyiyiIOsCt5ARziTMw=
X-Received: by 2002:a54:418f:: with SMTP id 15mr593423oiy.109.1589913942331;
 Tue, 19 May 2020 11:45:42 -0700 (PDT)
MIME-Version: 1.0
From: Javad Karabi <karabijavad@gmail.com>
Date: Tue, 19 May 2020 13:45:31 -0500
Message-ID: <CAEOHGO=uKYs0YQyG5K2BGd=_83j_m6nfompstAF-znRfus69Hw@mail.gmail.com>
Subject: regarding vcn
To: amd-gfx@lists.freedesktop.org
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

for a rx 5600 xt graphics card, is VCN supposed to be set to disabled?

if i understand correctly, 5600 is navi10, which has vcn

but i currently see VCN: disabled

$ sudo grep VCN /sys/kernel/debug/dri/1/amdgpu_pm_info
VCN: Disabled
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
