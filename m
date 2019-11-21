Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AC2D105ADC
	for <lists+amd-gfx@lfdr.de>; Thu, 21 Nov 2019 21:12:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9394F6E09F;
	Thu, 21 Nov 2019 20:12:29 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 805EE6E09F
 for <amd-gfx@lists.freedesktop.org>; Thu, 21 Nov 2019 20:12:28 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id y5so5162232wmi.5
 for <amd-gfx@lists.freedesktop.org>; Thu, 21 Nov 2019 12:12:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=qs1xk920i8TkViRSQAK1BH8RVQyWr3Gguf7XIldpNZo=;
 b=LGFSeH9y5tPTEywxvTfPXjPst1w90BjHyNYqYztjas3WkJGEFYqYxq5TPDCvlx4pKK
 rusDEy9jExUx/V6YuB0veak90tqO7DAY0B/BYw8h11j4Q1nFA184QkIKDdpSwH1De4fY
 tddZfZUspQxrvS38xUWcseaVcGiu2Uiwgg9D4heu6ey8/svl/TYw1EK5FJrxr7pCjd/R
 TSzamdun1hjiVc0exqH7X2DVl+vIOR3P8aG0AsggCi+0CkNVmap4I9uEHmf5mkilAtaA
 Mu2HWvtW9FWHqsF3YEm+E2HuTSL/O/Syp5R9tYN1LxTy/qn1De/b76XKBBzZ2FmhZm8+
 EH9g==
X-Gm-Message-State: APjAAAXwRHv+UntJn4uJDFtitVCp0xH5ViPLUdz06sLz+DQ+n0dKe4mH
 hnSh/BXNavaewIHrejH42qM7rh8p
X-Google-Smtp-Source: APXvYqy5zhXg4iyStkYmfohOS7I+xcbpxgW+NjH74TvmcNfj4ejhnINRZXmtspd82R1wcGDe94CHLQ==
X-Received: by 2002:a1c:1b07:: with SMTP id b7mr12403375wmb.111.1574367146995; 
 Thu, 21 Nov 2019 12:12:26 -0800 (PST)
Received: from localhost (108.78.124.78.rev.sfr.net. [78.124.78.108])
 by smtp.gmail.com with ESMTPSA id c11sm4353876wrv.92.2019.11.21.12.12.26
 for <amd-gfx@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Nov 2019 12:12:26 -0800 (PST)
Date: Thu, 21 Nov 2019 20:12:00 +0000
From: sylvain.bertrand@gmail.com
To: amd-gfx@lists.freedesktop.org
Subject: GFX[6-9] unconditionaly "allocate" the max of sgprs and vgprs to
 align on GFX10?
Message-ID: <20191121201200.GA11433@freedom>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/ (2018-04-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:subject:message-id:mime-version:content-disposition
 :user-agent;
 bh=qs1xk920i8TkViRSQAK1BH8RVQyWr3Gguf7XIldpNZo=;
 b=d114xMB72/4Oyt6Po63GhC84SJidUaQ9ZE84oe9pgqKShq14JgJAc+rKKGaRwm/Je6
 IajA405VW54PFCT9Ojh8TiSHiv+QEpf7zkuj8CgZTVMiZbyMA9tOL6j87egn/7XVH6OO
 ffAtoaSDzE/wweh15YaNp44NocRDOY3mmEHnP+UO1h6EAL0D4EizCASlRzqH1we7YOM8
 9UtB8mrOlfWdNx53jZibB6Z6/TNAK3Mm9U7D1qMxMrCQTIcG5PA+coZCZL9tfhpet2+v
 b2vcVxJD6gDH/6OhonhAq/KFP4sGWq9cI5il3EwYtWYZsigXbG9YgCcEycGEtZPrTtqB
 ytAg==
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

SGksCgpJcyB0aGlzIGEgZ29vZCBpZGVhPyAoc2VlIHRoZSBlbWFpbCBzdWJqZWN0KS4KCnJlZ2Fy
ZHMsCgotLSAKU3lsdmFpbgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
