Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 82DCE175A41
	for <lists+amd-gfx@lfdr.de>; Mon,  2 Mar 2020 13:18:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14F2488ED5;
	Mon,  2 Mar 2020 12:18:04 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3852C88ED5
 for <amd-gfx@lists.freedesktop.org>; Mon,  2 Mar 2020 12:18:03 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id 6so2453375wmi.5
 for <amd-gfx@lists.freedesktop.org>; Mon, 02 Mar 2020 04:18:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6929g4MfYlVOBXSY5N++zsLo5BT8m9Z+iDg6S6gOnhY=;
 b=nDjgF0rVN/HrunMJc6U771lds43YEPCRDOOD1HWL3/uq01Cq1Kg5hK3W6jDnZClFzn
 Zn39EhKiXNwVa0jw8yEg+dNmHVkP9/FT3Fx5yHPU3Kn7CBEI0cchuFlSzwggIHjiVJ8t
 74Jj7aAIsIfgw0mLId89j0IHlQRe4PndlaSgNwz4M/kEaWBpHWhcctFoTLes7w3/780p
 j99/9pCClWFFKJb4Yb+9kKncAPzCyE6bdY0Jb12S8LEqUDwBfRpscV958dYDbakyZlW9
 u2dmWhz3UDMT706BeK59t3DRIH6vxw3ps9ujESIktxgCC3RmsTYz5Fz/3H3rsv8cJDe0
 d/CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6929g4MfYlVOBXSY5N++zsLo5BT8m9Z+iDg6S6gOnhY=;
 b=YiaEzXNVkLVV9acJZt1S6XTwhjtKM5vGtM8Lbx1cZacyetHnuVlZNUuX02fqovz0TR
 IJiVP9fCD7sSUNFzUqR1aeODpZioOgdZITx/MLs7UwlSmVs+E48yvGdCtCnSgS4bVKmh
 pk/SSQXm2dvNGkkcrgNGtqthTBntGWr22DWaIcJeVMIJD9B9EgZF7lVEbBRNsCUgL9/+
 wOzYRmUvnTK3omWvEyPWaC+RMraa9bvL+bz8Q4Bc73k6qXujIQ8xbLVyUFmaZ7rC5x+P
 kGmOuWkRL+4TDStL8Mxrt9nVKFgleTfyT5AO8QCLxI9I2J72QFAlp/CQwWUh71Fce1wX
 DqKg==
X-Gm-Message-State: ANhLgQ2JrfmiezMnTBaDNMCDoevQT1ym5qlojyxFUXMUis3ukgWSfhUA
 6+vwnfs4QgiLxPqMJFOv7ITOf6V8
X-Google-Smtp-Source: ADFU+vt5XEUTMEsnSihmeD07vvjyejsBuIEK5d1tfIOBnUFH+w5RI1T3ziVsIumMzBZR4bmruq237w==
X-Received: by 2002:a05:600c:34d:: with SMTP id
 u13mr3361154wmd.32.1583151481723; 
 Mon, 02 Mar 2020 04:18:01 -0800 (PST)
Received: from abel.fritz.box ([2a02:908:1252:fb60:1cef:40a0:b16c:8c99])
 by smtp.gmail.com with ESMTPSA id b186sm15190969wmb.40.2020.03.02.04.18.01
 for <amd-gfx@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Mar 2020 04:18:01 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: Few TMZ BO move patches
Date: Mon,  2 Mar 2020 13:17:56 +0100
Message-Id: <20200302121759.13003-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
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

Because of a shift in priorities I won't work on TMZ this week.

So attached are a few smaller patches I already prepared, but the bounce copy for system eviction is still missing.

Patches are totally untested, but I anybody find them useful feel free to test and review them.

Regards,
Christian.


_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
