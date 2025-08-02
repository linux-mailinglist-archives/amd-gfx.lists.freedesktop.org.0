Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27C12B1EE68
	for <lists+amd-gfx@lfdr.de>; Fri,  8 Aug 2025 20:36:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D7E510E969;
	Fri,  8 Aug 2025 18:36:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="IaUKrCSd";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com
 [209.85.215.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B4E310E90C
 for <amd-gfx@lists.freedesktop.org>; Fri,  8 Aug 2025 10:40:08 +0000 (UTC)
Received: by mail-pg1-f177.google.com with SMTP id
 41be03b00d2f7-b423b13e2c3so1499362a12.3
 for <amd-gfx@lists.freedesktop.org>; Fri, 08 Aug 2025 03:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754649607; x=1755254407; darn=lists.freedesktop.org;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=wZx0keWVViIV9SLy1ca+p/bVU2WsaFgNX4kxSM5zVTw=;
 b=IaUKrCSdORHByuw7bB9FPC4WjNieX2AG0wQU8eNF/rB66mTNYpTJspPSpTXsb82zuF
 Q4viJyhSnUtQyR1Jh11pK2A/MLByKapvDCr+x1TaC7A89o7nw7zuLp3pvLZsG5/oJAul
 S6eX3/B4NaJo3PKWlcWjjWgHzGBAclpz9fGPs0BxNu7c2zvSjbXTNKExnDWoXHrodoCA
 G+wOKxVAK1fiaamLOt12Aff/ta5o3DnP/lC8irPfjT3XBP0yBlZLJrNy4qGouvtHptGn
 LTN8QiiZ5Bd8jW6tF81aDSd4q8EuAU7O3M1Ty5qRK5N60HDXqvCI2y13EUtND0wbA4/4
 cq3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754649607; x=1755254407;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wZx0keWVViIV9SLy1ca+p/bVU2WsaFgNX4kxSM5zVTw=;
 b=dKuWdKMEooUt1VicWryaphdfTY5QU/1g1jdvVS5akGEboXzJhukg1z9NMgvUhvPl47
 3pmojr88YH23j/G6dtPvcLem4Rn5KkWuM60VO6tH4eGflGczxMXt7SfETlHufEF8LPVr
 D4rdwf/jW3B/uGm3Hs5j/cNgK8GhA6B0/1c+oRB2+SLkwTrr5MK4V2tLX+i/DfeTyl/P
 JHQqNGP81CQheL5UkX6POjmSDG/BoPTgVOp+oBrQesh6FQf86yy11Ndw317q73XxlKts
 e3DyJSOGE1X4k8FuEoSgkM3BrDWsOotw/yPvyn0XnVALNc859cZ28VSeNL+OXoCwo2N6
 VEFw==
X-Gm-Message-State: AOJu0Yy4jQ/Sn6LF+1Uk77vBZQt7SUiQmihz+o/F6ersyEbqy4fI5n8v
 Q96ueGMM5e2O0c1fcIYFo1dIFQqNOHoTuxBwLcZm9dcBAPZtAe2iz3N/aP0d0mXlTHmKqQLY3S6
 UnjA/9iT1eDIC3cojMGHsJXGb4LvCL7nLWw==
X-Gm-Gg: ASbGnctgGpVJZssbup/vIAITcARKR4qsIV7+RrjpF3Eqm+3RvxFQBmG/DjQDW59LLQ/
 1/anG4U9vHG52xwPjCreMrV5//BH0d+57SOU9XmbOrtgctxIYGZhgDoyp4BhjVCXJEz78l7yIjt
 iCk48I163cEzFVzTPOrrtsPBRVptsnreauKS1X60dDU7T5jgwaJw8UPqkevK5LQaZcxZV6xze+X
 exj6Dtn/ykhF3eD
X-Google-Smtp-Source: AGHT+IFN06rLU8I5qcBl9G310i20RhUov5G/+2CRjs9zXcBYIy/5oN44zwI17Uc47P+JvUsfeYJ9vJF1c9iQbLN2u4o=
X-Received: by 2002:a17:902:f708:b0:240:2bb6:d4ae with SMTP id
 d9443c01a7336-242c21fd174mr27888495ad.30.1754649606962; Fri, 08 Aug 2025
 03:40:06 -0700 (PDT)
MIME-Version: 1.0
From: Varon Piongats <varonpiongats@gmail.com>
Date: Sat, 2 Aug 2025 19:47:13 +1000
X-Gm-Features: Ac12FXzBobLsMa05xz-SFV7Uu-cuf7HHwytJ4CfNTmXZHKzB70YIYVWw7iZssyc
Message-ID: <CAOsdz83P6Oy08yJjy00O73aSyrGXh4RJi5HWnNb-P5zvTr__Kw@mail.gmail.com>
Subject: Re: [PATCH 0/9] GMC 9.4.3 Support
To: amd-gfx@lists.freedesktop.org
Content-Type: multipart/alternative; boundary="000000000000874526063bd832b4"
X-Mailman-Approved-At: Fri, 08 Aug 2025 18:36:03 +0000
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
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--000000000000874526063bd832b4
Content-Type: text/plain; charset="UTF-8"



--000000000000874526063bd832b4
Content-Type: text/html; charset="UTF-8"

<div dir="auto"></div>

--000000000000874526063bd832b4--
