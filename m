Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B1CE13144E
	for <lists+amd-gfx@lfdr.de>; Mon,  6 Jan 2020 16:03:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 701C16E471;
	Mon,  6 Jan 2020 15:03:40 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA0506E471
 for <amd-gfx@lists.freedesktop.org>; Mon,  6 Jan 2020 15:03:39 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id b19so15235951wmj.4
 for <amd-gfx@lists.freedesktop.org>; Mon, 06 Jan 2020 07:03:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4sE1gXmQxcanhqeQRCrmHhBtEiloNtaads49t82jC78=;
 b=Igdo9qeOZFVkUFyuN6XJJi0vecYWz7RUg8bMVl/LrSk0YXbJqqHEfZci+xA1P8gIpq
 mj3Gkl/D/twv2mwAXzBnqx6wsGBGpUH7TvAHgyRHUdb4ylocr4Y/aDEZNdGe/mAPaLfg
 lOY64Lzr45tx1IYJL3bn2v4u1SNFKyxJLH6/iRmB2EHkj1WtaIX4EcRBx8DcZ9dqNz8m
 opinfg5SPnMKjCq9PsFS4TbnLzAgrQXicbUM5qDLa2TJuXz0+RWb7Y4p+Fzi/JX3Kqag
 skbGavuWxHefI9HBIWvb0KaBB1dAg+KT0eG8/d4V4CBsGj1sS/XBDntoJFFS1JaqZVrj
 shmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4sE1gXmQxcanhqeQRCrmHhBtEiloNtaads49t82jC78=;
 b=rtIcixfMLckStPCC53pDiBxb6Iymi2bYhxzTzfgTH7BgbxwKdj12iqSAkHyMjN9MPD
 Svn/nOVoH8/0HNplpdyPGOei1tYYV1Tyf3V6Uqop6C46i4q3S7wcipOkKdyK4NsQgVVn
 3eBdJQ+EGlGl/yP0l7sX62f4tfetmrbvGtXIU4KZvWncNbjUQSRFKCpBgrBmmS1poN1z
 1uE9aY9p10Lr8Y99qojxpAnnKZy3YzFTjs66Eliqu1Wfy0APUHyAcsWp3lxCqmvoCc/q
 v5mN67OY2f6TE0SEOyF8nBSRA/5nbuFiHGxOsHfByuILm4yN7xCvrHjo1PP1io1DRhAa
 SgMw==
X-Gm-Message-State: APjAAAWOHhOSJ8xe/ssdkJMGXRxbFeS02rV8lJ9cAJZMAjLcSJAyVVkK
 FJPRMJ5sdz0x9h9AP2eoOLIfCSe3
X-Google-Smtp-Source: APXvYqwkmlxaGPniwkxkSjtFhdLAbK/Vpv5eRjb7KV36Rn2xlTih0KBFmh3oixXrLSKThJpDh9ehpg==
X-Received: by 2002:a7b:cfc9:: with SMTP id f9mr36408968wmm.1.1578323018529;
 Mon, 06 Jan 2020 07:03:38 -0800 (PST)
Received: from abel.fritz.box ([2a02:908:1252:fb60:ece2:ff95:11ee:3e72])
 by smtp.gmail.com with ESMTPSA id b17sm70307444wrp.49.2020.01.06.07.03.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jan 2020 07:03:38 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: Alex.Sierra@amd.com, Philip.Yang@amd.com, Felix.Kuehling@amd.com,
 amd-gfx@lists.freedesktop.org
Subject: VM changes for invalidating PTEs without holding the reservation lock
Date: Mon,  6 Jan 2020 16:03:23 +0100
Message-Id: <20200106150335.1738-1-christian.koenig@amd.com>
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

Hi guys,

I'm still narrowing down one problem with the glob lru lock, but that only happens in a constructed test case so far.

Please take a look and comment,
Christian.


_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
