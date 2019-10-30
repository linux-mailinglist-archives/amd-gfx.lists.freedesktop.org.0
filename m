Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8172EA301
	for <lists+amd-gfx@lfdr.de>; Wed, 30 Oct 2019 19:07:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F09A36EB12;
	Wed, 30 Oct 2019 18:07:42 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E5CA6EB12
 for <amd-gfx@lists.freedesktop.org>; Wed, 30 Oct 2019 18:07:41 +0000 (UTC)
Received: by mail-pl1-x636.google.com with SMTP id p5so1330340plr.7
 for <amd-gfx@lists.freedesktop.org>; Wed, 30 Oct 2019 11:07:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:from:to:references:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language;
 bh=IVDUOM44TDNjiKFiWSC7qw3+nI3fJpWba3rah/7O60M=;
 b=SYzUMcFeuRGZMsVj/yDvGxjgOS4w0LdMusx49Ug4RghxyntQtZlEOua3r/l2Zb6Myc
 KOQyPRfhHQ8oXCuZTIx5n8GKHZw+E9rMkxTwbOlHOSKjKK1sAFa6sNBqOneu6yqkjcv+
 Gm/Q1j1LYVYWvHWRinLCSHYH2d2wRSAJNPMsoE78OiNp2jyYLe1FKXR60nHCOqVjqwPc
 E0RJGQOrNRi0LDReB384RUtATDBHxfh1yDL3OghegZXCe7cd59Z6GYKHEr3jNi4EKt9j
 xhOBRQLLeRdfHOKDfgX+A3krcLFomeiIQTqLlgy0x6ryWTV5fqnobiHwTDchCic7Fn5V
 Xm8Q==
X-Gm-Message-State: APjAAAW5ngTAwpZPw4cSLfgm0X5h0BdmAUtvMPJQo1HmoSfOjdwNyNcD
 H2yOM7aSA/uPhnrxK6fxFRo7z8rhS24=
X-Google-Smtp-Source: APXvYqxUDmweI5LKMn5i3d9NjVpgxhnIcPbOiH5B0F3rGc00C0Md21pH+encKIkmWFoq8gIjznB1Mw==
X-Received: by 2002:a17:902:6ac3:: with SMTP id
 i3mr1383079plt.294.1572458860407; 
 Wed, 30 Oct 2019 11:07:40 -0700 (PDT)
Received: from gideon.lan ([2604:3d09:137e:c000:2d5b:2e3d:2fc4:1247])
 by smtp.gmail.com with ESMTPSA id u36sm565228pgn.29.2019.10.30.11.07.39
 for <amd-gfx@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Oct 2019 11:07:40 -0700 (PDT)
Subject: Re: 21:9 monitor resolution incorrect since 4.14 kernel
From: Neil Mayhew <neil_mayhew@users.sourceforge.net>
To: amd-gfx@lists.freedesktop.org
References: <32e595a2-fdc1-7b13-2e33-c2b8752c60f2@users.sourceforge.net>
Autocrypt: addr=neil_mayhew@users.sourceforge.net; prefer-encrypt=mutual;
 keydata=
 mQGiBEOCDVoRBACvzIg0gdFah/8QoVvkjqX8bQCtvqE3asNqjQGhgPV6TE2M0jvI1HkqUZlK
 ZG5axdkgBoetMdxALVLvEiUiucqfmA+d9B/YqSu1NPIx//J0bahMbc//jqA4owogREa9ZQvq
 H34Il7238u7n77iauiKu2qCi0ln51aMTj+LLX2uwrwCg+scm7YRE/t44VlneseESIPa73YsE
 AIuzlm5GIb6Gq47nwDKvUYm6+vfEvPQpbwd/JQ5ep629cMgZTg04jNwwtZIb/I6gsfQXR7h3
 qLKdLP1QZmkER5WDg7eqwRTzsst91Ux/vMHxsJ0fJQAuFYiSSE4Hxquh0BperTcky22cA+ad
 7e50VZ5YSRRsyWSy73F3owAOFL5yA/4r9k6/Qs6wk1tJna7nabM9iQvmY5CNsd03evjcV88f
 Wip2HUqTx1Ryygs/4cD4V4cz3jHWNIKJ0vK//wALNs1FSvEgpwhqwjU6tQNcB/F+nxp/eI+P
 /ECjzO7ym2c9wXTBVDo8LTDiV6VXTEB6ei7buG9X1X9yoJrGS/IzrpVR/rQhTmVpbCBNYXlo
 ZXcgPG5laWxfbWF5aGV3QHNpbC5vcmc+iGEEExEIACECGwMCHgECF4AFAlNQGNoFCwkIBwMF
 FQoJCAsFFgIDAQAACgkQYtNAUVcAJm25swCgyaMGhhuJl666H3EjlghDAnxKbh4AnAp6j0nv
 4/kjcTWmGUvHSd8FbwqYuQINBEOCDWAQCACBMwnjPru4hSSLHkU9Ah9Khmqv3aZ/WAMQOE+s
 3eBPutR0q6+VLyaALl7O1nu4qBOIvsbkaa2GdH4KJivFkVE6fJUMDzccSabDjOK5WkK4VloR
 +ZL+ZX9y6qcf8J2ZnKVwhW0BOxQPZTawlXR0bk1sCWw6i9EsS3bOfl+F/BIMP618Xu52uKfb
 RrVf03SZqumtSCHdZ3F9PL6P2Ws4NuGfxD7YC3E9SpE2PP5e2QwtCPQ2ySL8PRv6sQR6p6f0
 shtuqckF/vAsLCHcfLiIBEcpGD10Frm2P9a20jVNbdVeKv2pb15bnEFq8ZstxO0c8NPJesmd
 FOjODFUUwcjK0dJzAAMGB/oCmU+2XNF7XA2GmtS6J/66Zyq3lI/b6wgBhOhL1+OeBmC/B5cz
 UNEwohdy0Ep7R0tDmR+SBYnAYe/W2CTbDc8SNdd3gT+JQIqAiZba6py3oTsRWQ1RaHhJy6fw
 PiMOy51JAnP9D4IxVQ/M67+tTM3+zKLeyet63vjRHG0zjzYSg/FFh87HIETRhvD4dMteS4b+
 07gKyl9YeFRZ2S9cl6bIMG7rKf3G8cU9P2E5Dy0MvHCbYnf9VBz+jAlP7T8XKZEdmv3CIncs
 nHiXE826FTz7HwWG2BmI87fTCycdPz57ufm2b5R8AEQ/A9gjj9Ve7OXG9ujFIBDhF2tqpLsH
 bx56iEkEGBECAAkFAkOCDWACGwwACgkQYtNAUVcAJm2J/QCg04zcu+oxN3MgPr8KvvMzOkbC
 JiEAn1NvGMGPBp/KACJ8Z0ivt32TCBcl
Message-ID: <10434d28-490d-ebbd-ab66-d3adb3a2e1de@users.sourceforge.net>
Date: Wed, 30 Oct 2019 12:07:38 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <32e595a2-fdc1-7b13-2e33-c2b8752c60f2@users.sourceforge.net>
Content-Language: en-CA
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:subject:from:to:references:autocrypt:message-id:date
 :user-agent:mime-version:in-reply-to:content-language;
 bh=IVDUOM44TDNjiKFiWSC7qw3+nI3fJpWba3rah/7O60M=;
 b=ldjvy4dzxpeX/VpIQD3sbrIbohDUVXfBxYW33Vx+jYL+abmsXXqadkQAYT7kQXR1jm
 jtRaj2PqTplaKxgfaEcWi9hDdXfES+sQKelYsqIxTqe+zpwYVGFJUH2LAbJlyFPn7FSC
 f7aBF4UdrYQDCs1Ao0IfnlQlmCZJ+S8+CY9cGpKeiqh+3xYZy4YJUGBbhxuR+DhyK6Oq
 DZAS/4fdM8n6XXoH9fSD9+dEj5N9wPXfWUJOAiaDJIhYFZ3DpK1zRl1WCO5H3ZQiaIeT
 THraonr+DYGNat1F08ZUB4ldQYMSbUgrB+bYkRzs2ELxhuouzkKNTBXoZ9Iih9z8nnKQ
 JUgA==
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
Content-Type: multipart/mixed; boundary="===============1010886320=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

This is a multi-part message in MIME format.
--===============1010886320==
Content-Type: multipart/alternative;
 boundary="------------429F2F58935EC85F010C4293"
Content-Language: en-CA

This is a multi-part message in MIME format.
--------------429F2F58935EC85F010C4293
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

I enabled kms debugging with drm.debug=3D4 on the kernel command line.
This enabled me to see that the relevant modes are being rejected with
error 11 which is DC_EXCEED_DONGLE_CAP. Sure enough, I see that there's
a dongle detected that's rated at 165MHz and my preferred modes are all
above that.

However, if I switch the monitors around everything is fine, because I
can use a lower resolution monitor with the dongle and get the 21:9
resolution on another output without a dongle.

The dongle is actually a passive DP to HDMI cable, and I need it because
one of my outputs is DP and I don't have any monitors with DP inputs. I
was told somewhere that I'd need to use the DP output to get the clock
speeds needed for 21:9, but apparently that's not true. Clearly the
cable can go above 165MHz since the 4.14 kernel can drive the display at
the preferred resolution using it, but thankfully I don't need to
concern myself with that now.

--------------429F2F58935EC85F010C4293
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    I enabled kms debugging with drm.debug=4 on the kernel command line.
    This enabled me to see that the relevant modes are being rejected
    with error 11 which is DC_EXCEED_DONGLE_CAP. Sure enough, I see that
    there's a dongle detected that's rated at 165MHz and my preferred
    modes are all above that.<br>
    <br>
    However, if I switch the monitors around everything is fine, because
    I can use a lower resolution monitor with the dongle and get the
    21:9 resolution on another output without a dongle.<br>
    <br>
    The dongle is actually a passive DP to HDMI cable, and I need it
    because one of my outputs is DP and I don't have any monitors with
    DP inputs. I was told somewhere that I'd need to use the DP output
    to get the clock speeds needed for 21:9, but apparently that's not
    true. Clearly the cable can go above 165MHz since the 4.14 kernel
    can drive the display at the preferred resolution using it, but
    thankfully I don't need to concern myself with that now.<br>
  </body>
</html>

--------------429F2F58935EC85F010C4293--

--===============1010886320==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============1010886320==--
