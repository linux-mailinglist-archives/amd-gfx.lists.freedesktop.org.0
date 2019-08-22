Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2190E99477
	for <lists+amd-gfx@lfdr.de>; Thu, 22 Aug 2019 15:06:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9ED236EB24;
	Thu, 22 Aug 2019 13:06:13 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [IPv6:2607:f8b0:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 234EA6EB24
 for <amd-gfx@lists.freedesktop.org>; Thu, 22 Aug 2019 13:06:12 +0000 (UTC)
Received: by mail-pf1-x42c.google.com with SMTP id f17so3923605pfn.6
 for <amd-gfx@lists.freedesktop.org>; Thu, 22 Aug 2019 06:06:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=JnThBK7yU/9Gtp00edn4uc9jMkD9Dk2XD3FNT4Tjn48=;
 b=E6akHF7GpZrQNn9iaqn/b9gBLsOMUNNCbxOFCGbeveuFAT3IxxTWjYJluWsbkdu5ev
 i30euB8sIzYjHt0fot4WTn8KHYSlqtzIdZ+u2UUjDs0VC52qSe+Z4i9bYFg7DkH6ADYP
 9/RRAoBfBuYNxuViNfWBn/ClX8o5Fr9xyc2hQKZJoDi6O8W1RxpXT9/PVu0LsMe7WgX3
 8PdkbScyap2HwYZGiApIu/w4KJQBl3sRuyk/jrAXT206y6N8X3pXOmrgCpBJU8rH/7ZA
 4j8phRuaMjg0Jl9McOqjgaqTSIprtmUepsl9a7ADJ4gR59cHI3ftRbN0qI70GSBaE2aH
 kIxA==
X-Gm-Message-State: APjAAAWWGVu9egi0eFIW0fBo7Fyr5EKigMkhC94FsIhw2ZQDB4WMVoj1
 /L13re14YtBlN8YoAwjJ/MvTeqde1NB/m8Dd93Qas9fu
X-Google-Smtp-Source: APXvYqwJ4qQFddH2XdmiOn7BBQqaCA6IrZcIMJU/ay9q6X3C8099sn+3P8UBiMTJgDefAvSXjnvj8k6wKeTHUPSMpSI=
X-Received: by 2002:a17:90a:ab01:: with SMTP id
 m1mr5142928pjq.69.1566479171114; 
 Thu, 22 Aug 2019 06:06:11 -0700 (PDT)
MIME-Version: 1.0
References: <CAFvQSYT+Qd8_tE7yvnjLt8RAduAEwUOuh3rvh0X7e3--LqQ78w@mail.gmail.com>
 <BN6PR12MB1809DE32DBA7017A974E8BDAF7A50@BN6PR12MB1809.namprd12.prod.outlook.com>
In-Reply-To: <BN6PR12MB1809DE32DBA7017A974E8BDAF7A50@BN6PR12MB1809.namprd12.prod.outlook.com>
From: Clemens Eisserer <linuxhippy@gmail.com>
Date: Thu, 22 Aug 2019 15:05:59 +0200
Message-ID: <CAFvQSYT-ZBjA+jtb81ggCE21P_8sXg=b9AEzMfjFntQ4EiRsbg@mail.gmail.com>
Subject: Re: atombios stuck executing D850 when trying to switch to 4k@60Hz on
 Polaris10
To: amd-gfx@lists.freedesktop.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=JnThBK7yU/9Gtp00edn4uc9jMkD9Dk2XD3FNT4Tjn48=;
 b=rO1EjNOgaEtc1fE2/SxMT2go7IqAeUVhhxiMJBTeye830qSFJSlUcpkLDM1xRFr67A
 Yxdh8q4rKGQuKGtPHeaLqQBiv2yaWJLt1dzFIdR3X0Qg+JGrocPbYv0FRT1y8mH+IwXL
 B7ndNFdfBGTACovhICUWKRZx9+FdbjjYi6CkSF4+CdlZ+pQIKnaGhlko6vusomJPcusO
 TU0y7OT5L6rCMtPLQUlwrDmWiTL9sPZdAY1uH+KUUGVrYdluqcfYS7EoMHmsWaAkzqaR
 9pkpUL8VuKD4XOGxdHCt3DiJugaNbX6nXzPeUY8cU3KmXqFCF91+DUMqDrPNWmL9gxW1
 CzgQ==
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

SGkgQWxleCwKCj4gWW91IG5lZWQgdG8gdXNlIGRjIHRvIHN1cHBvcnQgNGtANjAuICBSZW1vdmUg
YW1kZ3B1LmRjPTAgZnJvbSB0aGUga2VybmVsIGNvbW1hbmQgbGluZSBpbiBncnViLgoKVGhhbmtz
IGEgbG90IQpJbmRlZWQsIGl0IHdvcmtlZCBpbW1lZGlhdGx5IGFmdGVyIHJlbW92aW5nIHRob3Nl
IGxlZnQtb3ZlcnMgZnJvbSBteQprYXZlcmktYmFzZWQgc3lzdGVtLgoKQnIsIENsZW1lbnMKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWls
aW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
