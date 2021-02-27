Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 361F0326EF5
	for <lists+amd-gfx@lfdr.de>; Sat, 27 Feb 2021 21:43:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69C296E0D0;
	Sat, 27 Feb 2021 20:43:21 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90A2B6E0D0
 for <amd-gfx@lists.freedesktop.org>; Sat, 27 Feb 2021 20:43:20 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id lr13so20867779ejb.8
 for <amd-gfx@lists.freedesktop.org>; Sat, 27 Feb 2021 12:43:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=n49M6Y1gJdiKwdCa9+vsi+wbP7afEvVXOzpSQ8bQTrE=;
 b=GBRP77P7jdIOI75vZHk4xav84Y79Vuw7fIhQUruWNfQHfSaHSDdac6xRN+OQxHrwpo
 ppxFsFZ/O/dIoIZEl//EHEoZCJ/VzJQF1yC0kRut9zznaYOzjHo279owKOl+z0sPTFXm
 6Ms+SH+0UQBlBg2T4E5bsDqtfzoESVgguTPQGYv7NKgDYkhwRhHkcqNWfA4JjLOmZKty
 I9pcAToY4GvMZysH8BG+CPVyeXWCrBb/SGp97UE+SgFFyt8anpjQu4WS24K8kHsuiYkn
 dgdUA4Aa1yk28tLxCBIQU5CFZn35dgfO9pz5e/fQSdHTGLE0XDk3zX1FM0d7Ack8phxx
 NYtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=n49M6Y1gJdiKwdCa9+vsi+wbP7afEvVXOzpSQ8bQTrE=;
 b=DqofNA4jxPT63npO46jp1DNUAYpaVxqPsU9cx7cJFe39rJN+sqUg9tnMN3VIU3biM8
 I3FHwDa9Bh/n0epPHXKBwdUSH4AO+4pL0rwdqJeGte7eE52tj+YsSatdIS6eOsyPuN7V
 q7DFLf3KbL86qPnaZprA2oJAFt6nUi0SzlNuQVii2A9jW1Wqzx/RQ+ZmuFiol/A0vUF0
 nh+GhR9C9sHH88cOhUKw0yktOV/yM8pw57aBq8GrvyPIqmzlw3u0NS9VlG5/z06jvVh4
 XVfYwlWheCbo4Jbkm4iX9xVARQBRk9bFWCwlD1xvcHQRCx5rXDy0O886RdtR6tmo3PSl
 N6ug==
X-Gm-Message-State: AOAM533LRhSQSwkIOJDOblfpG/tOGiuDKhXgGjEgEyBR40UjdOtRBH9q
 uj014oAM7Tl44N8U+tfU/dNkwdX16VYSfyzBhjC+Yvgjc9qiUw==
X-Google-Smtp-Source: ABdhPJxIky6iHoiVn5Rqk45pKjARGCeRqOcZvtj4fSOU+DvNALitivnoq1D9z3VLhPt5zvDLboFdtJe6T16/hA7PX0o=
X-Received: by 2002:a17:906:8295:: with SMTP id
 h21mr9388637ejx.119.1614458598832; 
 Sat, 27 Feb 2021 12:43:18 -0800 (PST)
MIME-Version: 1.0
From: CCF_100 <foley2431@gmail.com>
Date: Sat, 27 Feb 2021 14:43:07 -0600
Message-ID: <CAKtNhmVTBH=y7e6onfc7ThdO-O1Qs02vq2FedNq8oM2Ja+BFUg@mail.gmail.com>
Subject: 
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
Content-Type: multipart/mixed; boundary="===============1258006967=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============1258006967==
Content-Type: multipart/alternative; boundary="00000000000049be4905bc576fe1"

--00000000000049be4905bc576fe1
Content-Type: text/plain; charset="UTF-8"

get 058960

--00000000000049be4905bc576fe1
Content-Type: text/html; charset="UTF-8"

<div dir="ltr">get 058960</div>

--00000000000049be4905bc576fe1--

--===============1258006967==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--===============1258006967==--
