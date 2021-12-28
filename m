Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D719D481447
	for <lists+amd-gfx@lfdr.de>; Wed, 29 Dec 2021 15:58:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E8E810E164;
	Wed, 29 Dec 2021 14:58:52 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D609D10F371
 for <amd-gfx@lists.freedesktop.org>; Tue, 28 Dec 2021 16:39:37 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id u13so42413331lff.12
 for <amd-gfx@lists.freedesktop.org>; Tue, 28 Dec 2021 08:39:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=H8rRIs+Dc63JbKCDd4MkQgeQCWemhSK3BTRWVoS1Sow=;
 b=WspvGVXDymJqnpRnvCGTkAG1cUqVVnHrQtN3ZJE7ckvV+FmmxYmO/yaP/Wlpg+RQ3Z
 f3GIVsubZzWzSX9baUKrHx47ij3sMyhjAcsWctVAIGh6N/TgZ1qssIBJN2kLGKUe2A1l
 mBX95wbx2Vv2S9GENllEU7RC1pZDE0yUXI/6VVckJj3eGDbn6i571gGYxUKzu7XIPcwz
 QtYN1QVUgkg1Nfqx7ewbS5qVLSnPGzTElhyk9QD+GXkMRfPtna6A49Ghbh7jBv4k1Oig
 dop9qS7AFeSCdF1B0vmYdlVorUT0a5n3PL8N/+dnQwEwkH/PXWzQgJCf/Yhx6PTybbMg
 2e0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=H8rRIs+Dc63JbKCDd4MkQgeQCWemhSK3BTRWVoS1Sow=;
 b=T66NuO2f/ais7CpXQcsaRo2QnacF3vq33hlMTm+aQCKYTTBcTMf5WTE7Z/RJEQI8Qc
 RJyjCdZrs2QrvKmoN7GXUb8YcC67P+LWce4cxL9w62aeIQcJSdMqM1+Jf8/d6fajBQhf
 37qse+9jRN0CxnXuwuVdWyIHeztDJF8eeVYMVAfT73DVd+Hdx2nxlymeP2ElS7d+CRIF
 gALGaf7dwZFVS3tAJZuy15wvxPyfdXTwe5UxawHKFe8lqnsSNVbWCEWgaHQEJoSv+iBa
 lCNrSwlsqkkbqUAO60WtpopUfiBbUP6CBY0d/+8kx9QCGTTyAVK9XSYZWWIz4WrP9zyh
 fp8w==
X-Gm-Message-State: AOAM531THO4BryQs2WAAcN2UnivtIWsPmEE7M2oD/9isE++seadzcKjw
 13ZNDZt5HT2VIVsKgeSPLar2GSzsIBSq8zHaCvo=
X-Google-Smtp-Source: ABdhPJy1uzAR71Lpg8vC2cun+Du5SM7g4gu6SG4r+g+o7+fdfCDfr18GkCpvEmDiERxxIzTR91Ba/JlOOajoNeYTC9c=
X-Received: by 2002:a19:c519:: with SMTP id w25mr20539755lfe.89.1640709576153; 
 Tue, 28 Dec 2021 08:39:36 -0800 (PST)
MIME-Version: 1.0
From: __- -__ <isapgswell@gmail.com>
Date: Tue, 28 Dec 2021 13:39:05 -0300
Message-ID: <CAN9WMdNZXeszX7ABqOrAu+Enx57KcQFAFbVy+iD3OFYT13yAwQ@mail.gmail.com>
Subject: nvidia-smi (on-demand)
To: nouveau@lists.freedesktop.org
Content-Type: multipart/alternative; boundary="000000000000775c6605d437771d"
X-Mailman-Approved-At: Wed, 29 Dec 2021 14:58:50 +0000
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

--000000000000775c6605d437771d
Content-Type: text/plain; charset="UTF-8"

?

NV-CONTROL


NV-GLX  (ok)

--000000000000775c6605d437771d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><br></div><div>?</div><div><br></div><div><span style=
=3D"background-color:rgb(255,153,0)"><span style=3D"color:rgb(255,255,0)">N=
V-CONTROL <br></span></span></div><div><span style=3D"background-color:rgb(=
255,153,0)"><span style=3D"color:rgb(255,255,0)"><br></span></span></div><d=
iv><span style=3D"background-color:rgb(255,255,255)"><span style=3D"color:r=
gb(255,255,0)"><br></span></span></div><div>NV-GLX=C2=A0 (<span style=3D"co=
lor:rgb(0,255,0)">ok</span>)</div><div><br></div><div><br></div></div>

--000000000000775c6605d437771d--
