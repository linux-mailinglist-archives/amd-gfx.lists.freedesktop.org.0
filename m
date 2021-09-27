Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1440A419759
	for <lists+amd-gfx@lfdr.de>; Mon, 27 Sep 2021 17:09:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62AB389FF9;
	Mon, 27 Sep 2021 15:09:28 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-40131.protonmail.ch (mail-40131.protonmail.ch
 [185.70.40.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2F4D89FF9
 for <amd-gfx@lists.freedesktop.org>; Mon, 27 Sep 2021 15:09:26 +0000 (UTC)
Date: Mon, 27 Sep 2021 15:09:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1632755361;
 bh=fXzawrdPhcEiRRS7QLhl1QHyY5X/UCeVEnskCKUH7bU=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=N3q8nlM1tBnSCynyg5Uipm+hGannC+rmUqXsWgyYW6EdS5xByFDPiY/BkJd7noAW3
 MfQ/X46GcWe4lWMMX7OOMxA92SxXM10jeXgKIepZSKCNoQ9MvU8HCSIRXnwyg8v3ss
 G18wCz2ELqZKr9sEk14h2vdhSVE/bv1CpdqtMqeXRSF9vf7ETKbzXDnNSLMz4ouVKR
 M5N6eIM88+D+CgsgdDVPGL5jS7CXUzrm92+UjfqjMSksfMYq4Iv7o49MgA0gPFPvAQ
 uhpyGwXovoiryR3oixdkWBkYQG39SHXZIl0U5NSOrnN+l82t7YAkuj9Kkud38cB1wR
 i2wfYUmEZLHhQ==
To: Alex Deucher <alexdeucher@gmail.com>
From: Simon Ser <contact@emersion.fr>
Cc: amd-gfx list <amd-gfx@lists.freedesktop.org>,
 "for 3.8" <stable@vger.kernel.org>, Alex Deucher <alexander.deucher@amd.com>,
 Harry Wentland <hwentlan@amd.com>,
 Nicholas Kazlauskas <Nicholas.Kazlauskas@amd.com>,
 =?utf-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>,
 Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
Subject: Re: [PATCH] amdgpu: check tiling flags when creating FB on GFX8-
Message-ID: <KvsBEjUfaluHmhGTchZazzOZHeVQEtdicj_znZpVB1gdwU3qaZr1bObQPplEh_EVcG2I_xsIUNuIEgFXCQ81VaLaiIgtKhfXE1q2NP718xs=@emersion.fr>
In-Reply-To: <CADnq5_PFMLUfadfA83bH7i4wAQdEtLWsKf7L7iLT_YjEhXDGug@mail.gmail.com>
References: <20210920103133.3573-1-contact@emersion.fr>
 <Kmwa-gfuqYfkMsvvUXAaujfROLLXX4PuTRBRQ5efixoEvM3arNB_yT5eure3D1iqmnFB54wnbB87S1zBLL-79Ci7fhqoKx-M-ciPVs5fcSU=@emersion.fr>
 <CADnq5_PFMLUfadfA83bH7i4wAQdEtLWsKf7L7iLT_YjEhXDGug@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
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
Reply-To: Simon Ser <contact@emersion.fr>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Monday, September 27th, 2021 at 16:57, Alex Deucher <alexdeucher@gmail.c=
om> wrote:

> No objections from me with the WARN_ONCE change suggested by Michel.

Cool, just sent v2 with Michel's comment fixed.
