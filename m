Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AB86841E1B
	for <lists+amd-gfx@lfdr.de>; Tue, 30 Jan 2024 09:42:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EADE1112E4C;
	Tue, 30 Jan 2024 08:42:46 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01olkn2038.outbound.protection.outlook.com [40.92.98.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F6DE112BD8
 for <amd-gfx@lists.freedesktop.org>; Tue, 30 Jan 2024 01:23:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PddoJJ80PG8h7dZm0yhDROyKO/0dJdSNHoxcPw/+C/ELXL7Ox8s1K2Q5oAhv1gESd/xSiSZnR41i7ToUwLQadFT/DONszxh/HNvEnv9XQA9GQGOOfGNrLmx2M1keVeHFc+jEULLoGFqfCmgfAUTmS2869shBaRUICZ7ReqKlh6zNHiFUTKdrcc5rSdQY0ouxr9cq84+tgl6sgfiZpIBu0dV58vmk0H65DgE9iBC9xSaT4SFSz8JowTl3amJBZ4XDYm36zbF0Tc+5kBRkgQzJB94qgEMIXK+LrVbkFlM5xk0URQvOIhhQ8srVcv6oblZPD5DP+xU9InX+ZrHsZk1a1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hSnqWnU/rrWhdVBYbgACgQGC4O8w6mK7fKwxb1TBl/k=;
 b=W1hhCESqSHbKBFxTKHg0GVBeHW9Hxyjt7ZCZYxQvHjfzmQaMfhxC5pbOvHgXfyTpqUfRVPGWbKFppLqDap7voMhrekpw13Qfpq88oAG7KinZTyQbEHsh/JyvPheH3+McvRI88yAvtbf9eDvEilSqIrOXD6OlNEpXtiN8n6An/j4PE91dAEaEWTUqThNKHd5Ro/24+BCGxHpqKtgClJ7ejYz9enYeGM04obvb9t8eYBbUNMd68WnX4fz56r9hPlcMqssWIGKddcUaYWJrMalwdOR9EQRXz19FIUEkunbyOVol9tm/NcYoLn0stzQWDYhE8LrhRZMLbnQ4cb45/VtL+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hSnqWnU/rrWhdVBYbgACgQGC4O8w6mK7fKwxb1TBl/k=;
 b=BlLD51ffxHlf99mTwksUKQ8P6qqfgdbA3Yu7SfL9O7lebXRtg+9p7Vfio8dwzgioEj0Ft2GsMOY5z/a5OyZg0L818Riswo4BaMPsPWjYuD4JTgJkE8vxxq9rPGcBGwJAWfaUEPjKfpC2EokaBY2HF/azpEg1ZoI+lOM7g9sZL7A9nY6H7J6EWBf9HJEryPe+THd4ixgfvEG1EWUsDU3GoB8u381VlPU2syO4U21YWWOI96kQ7qdBC76EcyP2NtprapNn+H0cB8Uq12Jis/YzpmMUM/7yxtfzOT2gGpX38Qe4LCmAVb7Ka/ibyydYe2QB+JbYLCmYdP/M+3+OYWSZrQ==
Received: from TY3P286MB2611.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:23e::10)
 by OS3P286MB1950.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:174::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.34; Tue, 30 Jan
 2024 01:22:59 +0000
Received: from TY3P286MB2611.JPNP286.PROD.OUTLOOK.COM
 ([fe80::6801:95d7:c963:398a]) by TY3P286MB2611.JPNP286.PROD.OUTLOOK.COM
 ([fe80::6801:95d7:c963:398a%5]) with mapi id 15.20.7228.029; Tue, 30 Jan 2024
 01:22:59 +0000
Message-ID: <TY3P286MB2611A528311D1AF2FF02B7EC987D2@TY3P286MB2611.JPNP286.PROD.OUTLOOK.COM>
Date: Tue, 30 Jan 2024 09:22:43 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: drm/amdkfd: Relocate TBA/TMA to opposite side of VM hole (v2)
To: Felix Kuehling <felix.kuehling@amd.com>, amd-gfx@lists.freedesktop.org
References: <20240125222748.2089791-1-felix.kuehling@amd.com>
 <5b23b3ef-2ccf-430e-bc0b-b4868358ad8f@outlook.com>
 <TY3P286MB2611C443C88FFC125AE79DA2987E2@TY3P286MB2611.JPNP286.PROD.OUTLOOK.COM>
 <8b8d9a37-111e-4c92-886d-f29da2abb527@amd.com>
 <TY3P286MB2611E17DA5FCC50F6FEC83BB987E2@TY3P286MB2611.JPNP286.PROD.OUTLOOK.COM>
 <d180e65f-7b3e-4413-baad-e40c3bb63fce@amd.com>
From: Shengyu Qu <wiagn233@outlook.com>
Autocrypt: addr=wiagn233@outlook.com; keydata=
 xsFNBGK0ObIBEADaNUAWkFrOUODvbPHJ1LsLhn/7yDzaCNWwniDqa4ip1dpBFFazLV3FGBjT
 +9pz25rHIFfsQcNOwJdJqREk9g4LgVfiy0H5hLMg9weF4EwtcbgHbv/q4Ww/W87mQ12nMCvY
 LKOVd/NsMQ3Z7QTO0mhG8VQ1Ntqn6jKQA4o9ERu3F+PFVDJx0HJ92zTBMzMtYsL7k+8ENOF3
 Iq1kmkRqf8FOvMObwwXLrEA/vsQ4bwojSKQIud6/SJv0w2YmqZDIAvDXxK2v22hzJqXaljmO
 BF5fz070O6eoTMhIAJy9ByBipiu3tWLXVtoj6QmFIoblnv0Ou6fJY2YN8Kr21vT1MXxdma1e
 l5WW/qxqrKCSrFzVdtAc7y6QtykC6MwC/P36O876vXfWUxrhHHRlnOxnuM6hz87g1kxu9qdr
 omSrsD0gEmGcUjV7xsNxut1iV+pZDIpveJdd5KJX5QMk3YzQ7ZTyiFD61byJcCZWtpN8pqwB
 +X85sxcr4V76EX85lmuQiwrIcwbvw5YRX1mRj3YZ4tVYCEaT5x+go6+06Zon3PoAjMfS1uo/
 2MxDuvVmdUkTzPvRWERKRATxay28efrE5uNQSaSNBfLKGvvPTlIoeYpRxLk7BN0xi/KZIRpS
 lIf0REc1eg+leq2Hxv7Xk/xGwSi5gGxLa6SzwXV8RRqKnw2u6QARAQABzSFTaGVuZ3l1IFF1
 IDx3aWFnbjIzM0BvdXRsb29rLmNvbT7CwY4EEwEKADgWIQSX5PUVXUNSaGVT2H/jUgzJGSnI
 5wUCYrQ5sgIbAwULCQgHAgYVCgkICwIEFgIDAQIeAQIXgAAKCRDjUgzJGSnI57GwD/9O6kei
 9M3nbb1PsFlDE1J9H27mlnRWzVJ2S3yJ8G1oJo8NSaRO7vcTsYPBYpEL1poDQC5MEGh6FXSi
 OnyyHrg8StmGLksQE9awuTnlnQgvXDQMVtm87r1abBAavP5ru2R9x/Tk63+W/VT2hPekMfHa
 JwFi1KATSI1AhsF3CVoj0yDulz1u0uZlircKdbeEDj+raMO0LA12YxWaWtL/b9XaoAqV9vor
 aKhx+0DsZS5bWoUvs+715BArPBr4hPqKavsBwOWfzWDTKln2qv8d+glWkmk6dgvZFcV/9JEJ
 Q8B7rOUMX614dqgwi1t71TI0Fbaou3nhAnES1i1it/aomDUCLvRwjGU2oarmUISFgvZoGYdB
 9DfVfY3FWKtfDJ9KLUk9k3BFfBZgeAYoLnFZwa3rMyruCojAGTApZtaaLZH/jzQf7FpIGGhD
 YnvGKXS01nLCHuZSOEvURLnWdgYeOtwKW1IIcnWJtB12Ajz2yVu3w4tIchRT3wekMh2c3A3Z
 DeEjszezhFyXgoRpNYDBzNl6vbqhnopixq5Wh/yAj6Ey0YrIUbW9NOhIVCGkP4GyJg756SGz
 yPny0U4lA+EP7PS3O7tE0I3Q5qzDH1AEH2proNlsvjZeG4OZ9XWerI5EoIxrwZcOP9GgprB4
 TrXUR0ScTy1wTKV1Hn+w3VAv6QKtFM7BTQRitDmyARAA0QGaP4NYsHikM9yct02Z/LTMS23F
 j4LK2mKTBoEwtC2qH3HywXpZ8Ii2RG2tIApKrQFs8yGI4pKqXYq+bE1Kf1+U8IxnG8mqUgI8
 aiQQUKyZdG0wQqT1w14aawu7Wr4ZlLsudNRcMnUlmf0r5DucIvVi7z9sC2izaf/aLJrMotIp
 Hz9zu+UJa8Gi3FbFewnpfrnlqF9KRGoQjq6FKcryGb1DbbC6K8OJyMBNMyhFp6qM/pM4L0tP
 VCa2KnLQf5Q19eZ3JLMprIbqKLpkh2z0VhDU/jNheC5CbOQuOuwAlYwhagPSYDV3cVAa4Ltw
 1MkTxVtyyanAxi+za6yKSKTSGGzdCCxiPsvR9if8a7tKhVykk4q2DDi0dSC6luYDXD2+hIof
 YGk6jvTLqVDd6ioFGBE0CgrAZEoT0mK6JXF3lHjnzuyWyCfuu7fzg6oDTgx3jhMQJ2P45zwJ
 7WyIjw1vZ3JeAb+5+D+N+vPblNrF4zRQzRoxpXRdbGbzsBd5BDJ+wyUVG+K5JNJ34AZIfFoD
 IbtRm3xt2tFrl1TxsqkDbACEWeI9H36VhkI3Cm/hbfp2w2zMK3vQGrhNuHybIS/8tJzdP3Ci
 zcOmgc61pDi/B6O2IXpkQpgz+Cv/ZiecDm1terRLkAeX84u8VcI4wdCkN/Od8ZMJOZ2Ff+DB
 bUslCmkAEQEAAcLBdgQYAQoAIBYhBJfk9RVdQ1JoZVPYf+NSDMkZKcjnBQJitDmyAhsMAAoJ
 EONSDMkZKcjnnIcP/1Px3fsgNqOEwVNH7hm0S2+x/N/t3kz50zpKhczHZ8GWbN3PPt4wkQkd
 bF+c7V4uXToN4a17bxGdUnA9qljxt8l3aEqd4jBqLn2OJriu21FSnrZOpxb1EwWwvnVUwrLx
 CuV0CFQJdBlYp2ds64aV8PcBOhQ62y1OAvYpAX1cx5UMcHsNVeqrWU0mDAOgvqB86JFduq+G
 mvbJwmh3dA8GnI2xquWaHIdkk06T55xjfFdabwEyuRmtKtqxTP/u6BzowkV2A/GLxWf1inH5
 M81QgGRI2sao6To7sUt45FS+y2zhwh62excOcSxcYqKzs/OiYEJjWMv9vYRwaqJGEVhbfGFO
 jeBOYr+ZCCeARh+z4ilo1C2wupQT8VPsFiY9DRYgkAPKlbn9OqJvoD7VhvyelJagSNuRayrr
 mnEaZMsoRdS22fneCVWM0xlGSgPCVD0n9+6unTnVbmF/BZsEg5QufQKqlFSomu1i23lRDPK/
 1aPc2IoxcQPh2fomy8spA5ROzOjLpgqL8ksEtQ75cBoF1K5mcC2Xo1GyDmdQvbIZe+8qwvQ3
 z9EDivvFtEByuZEeC5ixn4n/c9UKwlk+lQeQeN+Bk7l8G9phd4dWxnmWXQ/ONR/aLzG+Fguu
 GNZCPpu5dVQH44AXoFjoi9YVscUnWnv8sErY943hM8MUsMQ5D0P2
In-Reply-To: <d180e65f-7b3e-4413-baad-e40c3bb63fce@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64
X-TMN: [myJSmqJ0kvIRDV2E2SpwuKKi7+OV2QqiyVn6PxCTj/R0HesNw5S0GKEwD6nTRtJh]
X-ClientProxiedBy: SG2PR04CA0158.apcprd04.prod.outlook.com (2603:1096:4::20)
 To TY3P286MB2611.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:23e::10)
X-Microsoft-Original-Message-ID: <09c8d6fe-b2a4-48a6-a265-416300801315@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3P286MB2611:EE_|OS3P286MB1950:EE_
X-MS-Office365-Filtering-Correlation-Id: 67a1033b-5f00-4a56-96fe-08dc2131fe99
X-MS-Exchange-SLBlob-MailProps: P1EfU6pZOd+TDTDWDICcWHp52S08J3WLuC7QgheQK5Zaz0m0sLSRT2CNJUv/cv/nyAurvlCzc2loY8QLGhyePEDUcykeBZOThmt9O/nbhhEwqMOpd2PivHXank1fUdf/XJrAnr0WfR9WJHN33AHorLJyRSD2GmFGd5MJ01gbTlOxcHyZcyyMHwPu7XvOfVi0Nj9wg9a2+9TDVkYDS1RjadaN3I+Yz20ypO4KVkIUDPKGEfDwX36YHPhS5tCCRK+2l48Oi73Ew6gAk6kEiD/YtIOnHaFvBIVVdGAJQ0fKvcnPdhYkLj3bfKIEo5VrlDFsXDeju0AjkCttfrVe+M/ePZdN1ARMj5EDTQ2kMC3azJ7wR+GLsFZRJaXcyRFvZXj8S2BM+OjXRRD8FRaj1mlrxKf/EfhNOgVQh8xr3HlZOYSTP2k341j3j5RzZw+Q0P6HcMSbmBH/QWH4M/tNd9RVzt43GU6e/ggCuL5gD4/9BHo/rIHEWH4sOXSHefgquPTBBbGkf4wSXO//KDQ7bWyPCPQMijvRnP27MXUc8AQmdaIWo4F9qsVz0PYIMZdUBYwAgk5rTtfv996Hs8KR/eme36Z0g4P7Vb6jDZCS2bA5UhBuizXu0UZVYuPg78NXB5HxWt/wHzcl6Lu6pxq7B7Uo5HSU66cMGKFHVhpvC97dLWv9KPyUWh99pm5cgeC/wOsumD5eoEO7b19elI+1RYGOQOf1QPLm58vjuYmXHuwezDjnkuxd/kxlpunry7Yd1L3DY98T9xJfDkRmVj6A4t4J4KiQUWurnvk3YXxSpfYHLC8EWiyjMxY5HA==
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MwBIiPA/nDyYe6AO8CkZGTNTi/Rtz8O/QEaXv8hhv0L+FhxnC4sv8aVihDKafO5PjmLk79Ldm46QYlcRi2TN8B6zoaeD0a5/0ltGYbePC7NbTWT0KvelsnKB5DWRKCjLpC/pnJVrZjUirww3n/9t1TV70EvEoCJUzRBoY5Dv9122eoa839W4cCwpEconBViiVsGDC3xL02FWSQTi2GgUlEtZMURpilpofgCtG2c/Y9r2Dn+V1M55OEGCe+UpLiYnAWDg5l1Koe+Lr0ffRdhmi3msbheZrrNDUnkqcDZZGRPeKD85pXfwMzVks/VTgwDYrGx0uBRfRyy4SBW7Eq6Tm8LdVl4XbG74AssGXrtl+PNGlHYr1jy1GeW05ZNG9wGd2zNNhrD1yifrp4ocRATj16QQYLSz1MsMzaixG+XMd/55cW3AYyJkP6RWSbTx5Dh1TKh2SujTxB5SnnWCT1qNRlXnCMUpI0PecQoyXDxRMdjdyvKPYzhSe5Q2fNDbexRjraTwyu7xqczKeaEUP+oT2F86wvbNdvChJb0WwB61PMWgKvit/rK4+SSxNonzjAlv28ij8NDZKPaJvbE+8L8AbXV2rDyWjzlvLfrGpuIlsK4=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OTJad3g3Rkt0UHg5Q09pMm4yVVF1a1UyOVNpeUJJeDgrVWxLUlJIKzk3Rk9Y?=
 =?utf-8?B?MUdtVTYrQ3VGUmpKTzZqQUl1dEphQXp0V1dZNmpNSVZDYWg3N1NnbjZHR251?=
 =?utf-8?B?QVZyZ0EzWEFKQkJMZUVpN1JuN2FCYnRxSW41aFErd2tBenF6S3FOWldVb1Zx?=
 =?utf-8?B?aldQTEZZOXhGaUVCZjc1YXR6N3A1bE8yeFhFZHdxcy92NXBobzBIS2JLRTMy?=
 =?utf-8?B?NkVLekRMVEZjaG1EVnUra0JWWCtkVm9oNVRyN2ZYZ1pwRC9oQ1dSaW8yNStm?=
 =?utf-8?B?UTFiOVpOV0JLQ2R0cEFIQlpJTkYySG1ENWQ5QW1vdVRSOHhueWNLdGJYUlli?=
 =?utf-8?B?Y3BPam1VUEM1RmpqMFhqYlYxUlg4a1dncFNwaFFCNzNZY0RLYm5LNFdaczIw?=
 =?utf-8?B?aHpoTXBMYm9Ecmkra2dWdlFkUmlXUml3N1RGRzQrOXl2bjQ0d3g2U2tOdU9F?=
 =?utf-8?B?OGUxQlJsNTY5OFUxZlFRV2tybzl0SCtwbmg5bCtnV3g5Y1FOb0ZUQ1pkR2t1?=
 =?utf-8?B?L2RFLzBGdkxPa3R0Nk1RaVFXcnNiMlhmYjVTYmpVTmo3emZsZG5HV0Q3V2Yr?=
 =?utf-8?B?Qkt0WGhBL0YyeFphNEF6VjJTNGkyM2Y0ZFNoWTR5SG4vYk96SjhvQlBxYUxP?=
 =?utf-8?B?UUJOQzJ0QzZSZ2I2NGVjTndrcmF3cHFUVHlteFBWbWVvUlVwQThqUGNscEVI?=
 =?utf-8?B?UWNIRmVIMUhyQVZpOEdCMlhzVEdWb2prL09UOHlNU0xsZ0tkQldGWiswY2s2?=
 =?utf-8?B?Ymd6OWRpakVYNW1xcDQ2elUxd3BINjJxOWowdDN5cTIxcGVidXBLemZvWENM?=
 =?utf-8?B?eEVvSGpEbUJXWitqK2xpSEtXK0hZSkI1N0U4WFZmV3pIdCs2MWwrTXFvblc1?=
 =?utf-8?B?WGxPUEpBK0xsb1dDWVBMUGwrOHJvdFpJZVI1b3dnakY3bUE0WUVvQ0NjMisy?=
 =?utf-8?B?ZmRpbCtZdEZXanlQUkJCRExjTnladStSNjdxeGpzZWh2T0xpZlluSVJDQmxP?=
 =?utf-8?B?WUM2Z0x0MVo4OW9DMG5qMG1SdERaRWxic0ZxcW1STGlJQzVzSjNUZk5lUldU?=
 =?utf-8?B?OWVseEJLSEE0bVdaL1QySmtrQmE3UG1jcTFLdkdyNU16dWNYN0ErSnRwdGVu?=
 =?utf-8?B?bjBRMUhlcVUwd25Ya3Fiank2eVQwTzlLanhBQ0IvbDJFRFB3c2pJTFlRSjZZ?=
 =?utf-8?B?V3pIS0FRZ0FkUlZPNHFJWlU3cVZwRGRMQVphcmsyRkVKbmlEaFJEMlJKUElB?=
 =?utf-8?B?ZnFLQXRoTTE5VU5UdGcvSUpKRzMzY1hSV1pjRmZyOWhuYW9xTEtTckhoVTlu?=
 =?utf-8?B?dFNsUkxlM1dqNmlnNjdqY2tUN1R0VDZrckVJSmFKaGlCYk1iUm5LTmNQT01l?=
 =?utf-8?B?SURSZlIzVkYrSmQ4WE5BSnNqYVBRbXkxRTdER2dBaFJnUjk1K2pXbVpUTUEr?=
 =?utf-8?B?ZCtNcnkvTTZJd0ZnSjNpbkJ0cjFOOW16cHhhRUI5S2I4bzRTRlBHOE9STVh0?=
 =?utf-8?B?S0FBaDBRVUxnZk14KytUYjZ3M2loYlVYUmFwakpQdHFhemRsVlhiVk9LRzBv?=
 =?utf-8?B?YVI4TXAyVlZVbkRwUTB4aWZRU2dyZmhIdDRZU1pKQWc5VVg4YzYrcWgwKzB4?=
 =?utf-8?B?R2Z6eElXbjRjcVFZNDJMUjlEYUl4Zy9IYjlQNEdSRUJhZ08yaHNSMzA0aHp0?=
 =?utf-8?B?MVFJNFhCMDVFMG5ZcHFEYjRyNThNOFMyc0hzM1NTVWZMcGtWVkZRUXppem55?=
 =?utf-8?Q?R+EwxeDgogFfLv4b4c=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67a1033b-5f00-4a56-96fe-08dc2131fe99
X-MS-Exchange-CrossTenant-AuthSource: TY3P286MB2611.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2024 01:22:59.1923 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3P286MB1950
X-Mailman-Approved-At: Tue, 30 Jan 2024 08:42:45 +0000
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
Cc: Jay Cornwall <jay.cornwall@amd.com>,
 Christian Koenig <christian.koenig@amd.com>,
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

SGkgRmVsaXgsDQoNClRoYW5rcyBmb3IgcmVwbHkuIEknbGwgcmVjb3JkIGEgYmFja3RyYWNlIHdo
ZW4gSSdtIGZyZWUuIEJlc2lkZXMsIGhlcmUgaXMNCmEgZG1lc2cgbG9nIGZyb20gc29tZW9uZSBl
bHNlIGluIHRoZSBpc3N1ZSBkaXNjdXNzaW9uIGFib3V0IHRoaXMgcHJvYmxlbToNCmh0dHBzOi8v
cHJvamVjdHMuYmxlbmRlci5vcmcvYXR0YWNobWVudHMvZWE3YjdkYjUtYWMxNi00NzlkLTkzNWIt
OWUxZGEzM2NkNmYwDQpUZXN0ZWQgdXNpbmcgbmV4dC0yMDI0MDEyOSB3aXRoIHRoaXMgcGF0Y2gg
YXBwbGllZCwgYW5kIHNldHVwIGlzIFBsYXNtYSA2LjANClJDMShXYXlsYW5kKSArIFJYIDY2MDAg
WFQuDQoNCkJlc3QgcmVnYXJkcywNClNoZW5neXUNCg0K5ZyoIDIwMjQvMS8zMCAxOjQ3LCBGZWxp
eCBLdWVobGluZyDlhpnpgZM6DQo+IE9uIDIwMjQtMDEtMjkgMTA6MjQsIFNoZW5neXUgUXUgd3Jv
dGU6DQo+PiBIZWxsbyBGZWxpeCwNCj4+IEkgdGhpbmsgeW91IGFyZSByaWdodC4gVGhpcyBwcm9i
bGVtIGhhcyBleGlzdGVkIGZvciB5ZWFycyhqdXN0IGxvb2sgYXQNCj4+IHRoZQ0KPj4gaXNzdWUg
Y3JlYXRpb24gdGltZSBpbiBteSBsaW5rKSwgYW5kIGlzIHRob3VnaHQgY2F1c2VkIGJ5IE9wZW5H
TC1ST0NNVGUNCj4+IGludGVyb3AodGhhdCdzIHdoeSBJIHRoaW5rIHRoaXMgcGF0Y2ggbWlnaHQg
aGVscCkuIEl0IGlzIHZlcnkgZWFzeSB0bw0KPj4gdHJpZ2dlciB0aGlzIHByb2JsZW0gaW4gYmxl
bmRlcihtZXRob2QgaXMgYWxzbyBtZW50aW9uZWQgaW4gdGhlIGxpbmspLg0KPiANCj4gVGhpcyBk
b2Vzbid0IGhlbHAgeW91LCBidXQgaXQncyB1bmxpa2VseSB0aGF0IHRoaXMgaGFzIGJlZW4gdGhl
IHNhbWUNCj4gaXNzdWUgZm9yIHR3byB5ZWFycyBmb3IgZXZlcnlib2R5IHdobyBjaGltZWQgaW50
byB0aGlzIGJ1ZyByZXBvcnQuDQo+IERpZmZlcmVudCBrZXJuZWwgdmVyc2lvbnMsIEdQVXMsIHVz
ZXIgbW9kZSBST0NtIGFuZCBNZXNhIHZlcnNpb25zIGV0Yy4NCj4gDQo+IENhc2UgaW4gcG9pbnQs
IGl0J3MgcG9zc2libGUgdGhhdCB5b3UncmUgc2VlaW5nIGFuIGlzc3VlIHNwZWNpZmljIHRvDQo+
IFJETkEzLCB3aGljaCBoYXNuJ3QgZXZlbiBiZWVuIGFyb3VuZCBmb3IgdGhhdCBsb25nLg0KPiAN
Cj4gDQo+PiBEbw0KPj4geW91IGhhdmUgYW55IGlkZWEgYWJvdXQgdGhpcz8NCj4gDQo+IE5vdCB3
aXRob3V0IHNlZWluZyBhIGxvdCBtb3JlIGRpYWdub3N0aWMgaW5mb3JtYXRpb24uIEEgZnVsbCBi
YWNrdHJhY2UNCj4gZnJvbSB5b3VyIGtlcm5lbCBsb2cgd291bGQgYmUgYSBnb29kIHN0YXJ0Lg0K
PiANCj4gUmVnYXJkcywNCj4gwqAgRmVsaXgNCj4gDQo+IA0KPj4gQmVzdCByZWdhcmRzLA0KPj4g
U2hlbmd5dQ0KPj4g5ZyoIDIwMjQvMS8yOSAyMjo1MSwgRmVsaXggS3VlaGxpbmcg5YaZ6YGTOg0K
Pj4+IE9uIDIwMjQtMDEtMjkgODo1OCwgU2hlbmd5dSBRdSB3cm90ZToNCj4+Pj4gSGksDQo+Pj4+
IFNlZW1zIHJvY20tb3BlbmdsIGludGVyb3AgaGFuZyBwcm9ibGVtIHN0aWxsIGV4aXN0c1sxXS4g
QnR3IGhhdmUgeW91DQo+Pj4+IGRpc2NvdmVyZWQgaW50byB0aGlzIHByb2JsZW0/DQo+Pj4+IEJl
c3QgcmVnYXJkcywNCj4+Pj4gU2hlbmd5dQ0KPj4+PiBbMV0NCj4+Pj4gaHR0cHM6Ly9wcm9qZWN0
cy5ibGVuZGVyLm9yZy9ibGVuZGVyL2JsZW5kZXIvaXNzdWVzLzEwMDM1MyNpc3N1ZWNvbW1lbnQt
MTExMTU5OQ0KPj4+DQo+Pj4gTWF5YmUgeW91J3JlIGhhdmluZyBhIGRpZmZlcmVudCBwcm9ibGVt
LiBEbyB5b3Ugc2VlIHRoaXMgaXNzdWUgYWxzbw0KPj4+IHdpdGhvdXQgYW55IHZlcnNpb24gb2Yg
dGhlICJSZWxvY2F0ZSBUQkEvVE1BIC4uLiIgcGF0Y2g/DQo+Pj4NCj4+PiBSZWdhcmRzLA0KPj4+
IMKgIEZlbGl4DQo+Pj4NCj4+Pg0KPj4+Pg0KPj4+PiDlnKggMjAyNC8xLzI3IDAzOjE1LCBTaGVu
Z3l1IFF1IOWGmemBkzoNCj4+Pj4+IEhlbGxvIEZlbGl4LA0KPj4+Pj4gVGhpcyBwYXRjaCBzZWVt
cyB3b3JraW5nIG9uIG15IHN5c3RlbSwgYWxzbyBpdCBzZWVtcyBmaXhlcyB0aGUNCj4+Pj4+IFJP
Q00vT3BlbkdMDQo+Pj4+PiBpbnRlcm9wIHByb2JsZW0uDQo+Pj4+PiBJcyB0aGlzIGludGVuZGVk
IHRvIGhhcHBlbiBvciBub3Q/IE1heWJlIHdlIG5lZWQgbW9yZSB1c2VycyB0byB0ZXN0DQo+Pj4+
PiBpdC4NCj4+Pj4+IEJlc2lkZXMsDQo+Pj4+PiBUZXN0ZWQtYnk6IFNoZW5neXUgUXUgPHdpYWdu
MjMzQG91dGxvb2suY29tPg0KPj4+Pj4gQmVzdCBSZWdhcmRzLA0KPj4+Pj4gU2hlbmd5dQ0KPj4+
Pj4NCj4+Pj4+IOWcqCAyMDI0LzEvMjYgMDY6MjcsIEZlbGl4IEt1ZWhsaW5nIOWGmemBkzoNCj4+
Pj4+PiBUaGUgVEJBIGFuZCBUTUEsIGFsb25nIHdpdGggYW4gdW51c2VkIElCIGFsbG9jYXRpb24s
IHJlc2lkZSBhdCBsb3cNCj4+Pj4+PiBhZGRyZXNzZXMgaW4gdGhlIFZNIGFkZHJlc3Mgc3BhY2Uu
IEEgc3RyYXkgVk0gZmF1bHQgd2hpY2ggaGl0cyB0aGVzZQ0KPj4+Pj4+IHBhZ2VzIG11c3QgYmUg
c2VydmljZWQgYnkgbWFraW5nIHRoZWlyIHBhZ2UgdGFibGUgZW50cmllcyBpbnZhbGlkLg0KPj4+
Pj4+IFRoZSBzY2hlZHVsZXIgZGVwZW5kcyB1cG9uIHRoZXNlIHBhZ2VzIGJlaW5nIHJlc2lkZW50
IGFuZCBmYWlscywNCj4+Pj4+PiBwcmV2ZW50aW5nIGEgZGVidWdnZXIgZnJvbSBpbnNwZWN0aW5n
IHRoZSBmYWlsdXJlIHN0YXRlLg0KPj4+Pj4+DQo+Pj4+Pj4gQnkgcmVsb2NhdGluZyB0aGVzZSBw
YWdlcyBhYm92ZSA0NyBiaXRzIGluIHRoZSBWTSBhZGRyZXNzIHNwYWNlIHRoZXkNCj4+Pj4+PiBj
YW4gb25seSBiZSByZWFjaGVkIHdoZW4gYml0cyBbNjM6NDhdIGFyZSBzZXQgdG8gMS4gVGhpcyBt
YWtlcyBpdA0KPj4+Pj4+IG11Y2gNCj4+Pj4+PiBsZXNzIGxpa2VseSBmb3IgYSBtaXNiZWhhdmlu
ZyBwcm9ncmFtIHRvIGdlbmVyYXRlIGFjY2Vzc2VzIHRvIHRoZW0uDQo+Pj4+Pj4gVGhlIGN1cnJl
bnQgcGxhY2VtZW50IGF0IFZBIChQQUdFX1NJWkUqMikgaXMgcmVhZGlseSBoaXQgYnkgYSBOVUxM
DQo+Pj4+Pj4gYWNjZXNzIHdpdGggYSBzbWFsbCBvZmZzZXQuDQo+Pj4+Pj4NCj4+Pj4+PiB2MjoN
Cj4+Pj4+PiAtIE1vdmUgaXQgdG8gdGhlIHJlc2VydmVkIHNwYWNlIHRvIGF2b2lkIGNvbmNmbGlj
dHMgd2l0aCBNZXNhDQo+Pj4+Pj4gLSBBZGQgbWFjcm9zIHRvIG1ha2UgcmVzZXJ2ZWQgc3BhY2Ug
bWFuYWdlbWVudCBlYXNpZXINCj4+Pj4+Pg0KPj4+Pj4+IENjOiBBcnVucHJhdmluIFBhbmVlciBT
ZWx2YW0gPEFydW5wcmF2aW4uUGFuZWVyU2VsdmFtQGFtZC5jb20+DQo+Pj4+Pj4gQ2M6IENocmlz
dGlhbiBLb2VuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4NCj4+Pj4+PiBTaWduZWQtb2Zm
LWJ5OiBKYXkgQ29ybndhbGwgPGpheS5jb3Jud2FsbEBhbWQuY29tPg0KPj4+Pj4+IFNpZ25lZC1v
ZmYtYnk6IEZlbGl4IEt1ZWhsaW5nIDxmZWxpeC5rdWVobGluZ0BhbWQuY29tPg0KPj4+Pj4+IC0t
LQ0KPj4+Pj4+IMKgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9jc2EuY8KgwqDC
oMKgwqAgfMKgIDQgKy0tDQo+Pj4+Pj4gwqAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X3NlcTY0LmPCoMKgwqAgfMKgIDcgKystLS0NCj4+Pj4+PiDCoCBkcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfdm0uaMKgwqDCoMKgwqDCoCB8IDEyICsrKysrKy0tDQo+Pj4+Pj4g
wqAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2ZsYXRfbWVtb3J5LmMgfCAzMA0KPj4+
Pj4+ICsrKysrKysrKysrLS0tLS0tLS0tDQo+Pj4+Pj4gwqAgNCBmaWxlcyBjaGFuZ2VkLCAzMCBp
bnNlcnRpb25zKCspLCAyMyBkZWxldGlvbnMoLSkNCj4+Pj4+Pg0KPj4+Pj4+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfY3NhLmMNCj4+Pj4+PiBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9jc2EuYw0KPj4+Pj4+IGluZGV4IDgyM2QzMWY0
YTJhMy4uNTNkMGE0NThkNzhlIDEwMDY0NA0KPj4+Pj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV9jc2EuYw0KPj4+Pj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV9jc2EuYw0KPj4+Pj4+IEBAIC0yOCw5ICsyOCw5IEBADQo+Pj4+Pj4gwqAg
wqAgdWludDY0X3QgYW1kZ3B1X2NzYV92YWRkcihzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikN
Cj4+Pj4+PiDCoCB7DQo+Pj4+Pj4gLcKgwqDCoCB1aW50NjRfdCBhZGRyID0gYWRldi0+dm1fbWFu
YWdlci5tYXhfcGZuIDw8DQo+Pj4+Pj4gQU1ER1BVX0dQVV9QQUdFX1NISUZUOw0KPj4+Pj4+ICvC
oMKgwqAgdWludDY0X3QgYWRkciA9IEFNREdQVV9WQV9SRVNFUlZFRF9DU0FfU1RBUlQoDQo+Pj4+
Pj4gK8KgwqDCoMKgwqDCoMKgIGFkZXYtPnZtX21hbmFnZXIubWF4X3BmbiA8PCBBTURHUFVfR1BV
X1BBR0VfU0hJRlQpOw0KPj4+Pj4+IMKgIC3CoMKgwqAgYWRkciAtPSBBTURHUFVfVkFfUkVTRVJW
RURfQ1NBX1NJWkU7DQo+Pj4+Pj4gwqDCoMKgwqDCoCBhZGRyID0gYW1kZ3B1X2dtY19zaWduX2V4
dGVuZChhZGRyKTsNCj4+Pj4+PiDCoCDCoMKgwqDCoMKgIHJldHVybiBhZGRyOw0KPj4+Pj4+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfc2VxNjQuYw0KPj4+
Pj4+IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3NlcTY0LmMNCj4+Pj4+PiBp
bmRleCAzZDBkNTYwODdkNDEuLjllNzY5ZWY1MGYyZSAxMDA2NDQNCj4+Pj4+PiAtLS0gYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfc2VxNjQuYw0KPj4+Pj4+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9zZXE2NC5jDQo+Pj4+Pj4gQEAgLTQ1LDExICs0
NSw4IEBADQo+Pj4+Pj4gwqDCoCAqLw0KPj4+Pj4+IMKgIHN0YXRpYyBpbmxpbmUgdTY0IGFtZGdw
dV9zZXE2NF9nZXRfdmFfYmFzZShzdHJ1Y3QgYW1kZ3B1X2RldmljZQ0KPj4+Pj4+ICphZGV2KQ0K
Pj4+Pj4+IMKgIHsNCj4+Pj4+PiAtwqDCoMKgIHU2NCBhZGRyID0gYWRldi0+dm1fbWFuYWdlci5t
YXhfcGZuIDw8IEFNREdQVV9HUFVfUEFHRV9TSElGVDsNCj4+Pj4+PiAtDQo+Pj4+Pj4gLcKgwqDC
oCBhZGRyIC09IEFNREdQVV9WQV9SRVNFUlZFRF9UT1A7DQo+Pj4+Pj4gLQ0KPj4+Pj4+IC3CoMKg
wqAgcmV0dXJuIGFkZHI7DQo+Pj4+Pj4gK8KgwqDCoCByZXR1cm4gQU1ER1BVX1ZBX1JFU0VSVkVE
X1NFUTY0X1NUQVJUKA0KPj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCBhZGV2LT52bV9tYW5hZ2VyLm1h
eF9wZm4gPDwgQU1ER1BVX0dQVV9QQUdFX1NISUZUKTsNCj4+Pj4+PiDCoCB9DQo+Pj4+Pj4gwqAg
wqAgLyoqDQo+Pj4+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV92bS5oDQo+Pj4+Pj4gYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdm0u
aA0KPj4+Pj4+IGluZGV4IDY2NjY5OGE1NzE5Mi4uZjIzYjYxNTNkMzEwIDEwMDY0NA0KPj4+Pj4+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92bS5oDQo+Pj4+Pj4gKysr
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZtLmgNCj4+Pj4+PiBAQCAtMTM1
LDExICsxMzUsMTkgQEAgc3RydWN0IGFtZGdwdV9tZW1fc3RhdHM7DQo+Pj4+Pj4gwqAgI2RlZmlu
ZSBBTURHUFVfSVNfTU1IVUIwKHgpICgoeCkgPj0gQU1ER1BVX01NSFVCMF9TVEFSVCAmJiAoeCkg
PA0KPj4+Pj4+IEFNREdQVV9NTUhVQjFfU1RBUlQpDQo+Pj4+Pj4gwqAgI2RlZmluZSBBTURHUFVf
SVNfTU1IVUIxKHgpICgoeCkgPj0gQU1ER1BVX01NSFVCMV9TVEFSVCAmJiAoeCkgPA0KPj4+Pj4+
IEFNREdQVV9NQVhfVk1IVUJTKQ0KPj4+Pj4+IMKgIC0vKiBSZXNlcnZlIDJNQiBhdCB0b3AvYm90
dG9tIG9mIGFkZHJlc3Mgc3BhY2UgZm9yIGtlcm5lbCB1c2UgKi8NCj4+Pj4+PiArLyogUmVzZXJ2
ZSBzcGFjZSBhdCB0b3AvYm90dG9tIG9mIGFkZHJlc3Mgc3BhY2UgZm9yIGtlcm5lbCB1c2UgKi8N
Cj4+Pj4+PiDCoCAjZGVmaW5lIEFNREdQVV9WQV9SRVNFUlZFRF9DU0FfU0laRcKgwqDCoMKgwqDC
oMKgICgyVUxMIDw8IDIwKQ0KPj4+Pj4+ICsjZGVmaW5lIEFNREdQVV9WQV9SRVNFUlZFRF9DU0Ff
U1RBUlQodG9wKcKgwqDCoCAoKHRvcCkgXA0KPj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLSBBTURHUFVfVkFfUkVTRVJWRURfQ1NBX1NJWkUp
DQo+Pj4+Pj4gwqAgI2RlZmluZSBBTURHUFVfVkFfUkVTRVJWRURfU0VRNjRfU0laRcKgwqDCoMKg
wqDCoMKgICgyVUxMIDw8IDIwKQ0KPj4+Pj4+ICsjZGVmaW5lIEFNREdQVV9WQV9SRVNFUlZFRF9T
RVE2NF9TVEFSVCh0b3ApDQo+Pj4+Pj4gKEFNREdQVV9WQV9SRVNFUlZFRF9DU0FfU1RBUlQodG9w
KSBcDQo+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCAtIEFNREdQVV9WQV9SRVNFUlZFRF9TRVE2NF9TSVpFKQ0KPj4+Pj4+ICsjZGVmaW5lIEFN
REdQVV9WQV9SRVNFUlZFRF9UUkFQX1NJWkXCoMKgwqDCoMKgwqDCoCAoMlVMTCA8PCAxMikNCj4+
Pj4+PiArI2RlZmluZSBBTURHUFVfVkFfUkVTRVJWRURfVFJBUF9TVEFSVCh0b3ApDQo+Pj4+Pj4g
KEFNREdQVV9WQV9SRVNFUlZFRF9TRVE2NF9TVEFSVCh0b3ApIFwNCj4+Pj4+PiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC0gQU1ER1BVX1ZBX1JFU0VS
VkVEX1RSQVBfU0laRSkNCj4+Pj4+PiDCoCAjZGVmaW5lIEFNREdQVV9WQV9SRVNFUlZFRF9CT1RU
T03CoMKgwqDCoMKgwqDCoCAoMlVMTCA8PCAyMCkNCj4+Pj4+PiAtI2RlZmluZSBBTURHUFVfVkFf
UkVTRVJWRURfVE9QIChBTURHUFVfVkFfUkVTRVJWRURfU0VRNjRfU0laRSArIFwNCj4+Pj4+PiAr
I2RlZmluZSBBTURHUFVfVkFfUkVTRVJWRURfVE9QIChBTURHUFVfVkFfUkVTRVJWRURfVFJBUF9T
SVpFICsgXA0KPj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgQU1ER1BVX1ZBX1JFU0VSVkVEX1NFUTY0X1NJWkUgKyBcDQo+Pj4+Pj4gwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBBTURHUFVfVkFf
UkVTRVJWRURfQ1NBX1NJWkUpDQo+Pj4+Pj4gwqAgwqAgLyogU2VlIHZtX3VwZGF0ZV9tb2RlICov
DQo+Pj4+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9mbGF0
X21lbW9yeS5jDQo+Pj4+Pj4gYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfZmxhdF9t
ZW1vcnkuYw0KPj4+Pj4+IGluZGV4IDY2MDRhM2Y5OWM1ZS4uZjg5OWNjZTI1YjJhIDEwMDY0NA0K
Pj4+Pj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9mbGF0X21lbW9yeS5j
DQo+Pj4+Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2ZsYXRfbWVtb3J5
LmMNCj4+Pj4+PiBAQCAtMzYsNiArMzYsNyBAQA0KPj4+Pj4+IMKgICNpbmNsdWRlIDxsaW51eC9t
bS5oPg0KPj4+Pj4+IMKgICNpbmNsdWRlIDxsaW51eC9tbWFuLmg+DQo+Pj4+Pj4gwqAgI2luY2x1
ZGUgPGxpbnV4L3Byb2Nlc3Nvci5oPg0KPj4+Pj4+ICsjaW5jbHVkZSAiYW1kZ3B1X3ZtLmgiDQo+
Pj4+Pj4gwqAgwqAgLyoNCj4+Pj4+PiDCoMKgICogVGhlIHByaW1hcnkgbWVtb3J5IEkvTyBmZWF0
dXJlcyBiZWluZyBhZGRlZCBmb3IgcmV2aXNpb25zIG9mDQo+Pj4+Pj4gZ2Z4aXANCj4+Pj4+PiBA
QCAtMzI2LDEwICszMjcsMTYgQEAgc3RhdGljIHZvaWQga2ZkX2luaXRfYXBlcnR1cmVzX3ZpKHN0
cnVjdA0KPj4+Pj4+IGtmZF9wcm9jZXNzX2RldmljZSAqcGRkLCB1aW50OF90IGlkKQ0KPj4+Pj4+
IMKgwqDCoMKgwqDCoCAqIHdpdGggc21hbGwgcmVzZXJ2ZWQgc3BhY2UgZm9yIGtlcm5lbC4NCj4+
Pj4+PiDCoMKgwqDCoMKgwqAgKiBTZXQgdGhlbSB0byBDQU5PTklDQUwgYWRkcmVzc2VzLg0KPj4+
Pj4+IMKgwqDCoMKgwqDCoCAqLw0KPj4+Pj4+IC3CoMKgwqAgcGRkLT5ncHV2bV9iYXNlID0gU1ZN
X1VTRVJfQkFTRTsNCj4+Pj4+PiArwqDCoMKgIHBkZC0+Z3B1dm1fYmFzZSA9IG1heChTVk1fVVNF
Ul9CQVNFLCBBTURHUFVfVkFfUkVTRVJWRURfQk9UVE9NKTsNCj4+Pj4+PiDCoMKgwqDCoMKgIHBk
ZC0+Z3B1dm1fbGltaXQgPQ0KPj4+Pj4+IHBkZC0+ZGV2LT5rZmQtPnNoYXJlZF9yZXNvdXJjZXMu
Z3B1dm1fc2l6ZSAtIDE7DQo+Pj4+Pj4gwqAgK8KgwqDCoCAvKiBkR1BVczogdGhlIHJlc2VydmVk
IHNwYWNlIGZvciBrZXJuZWwNCj4+Pj4+PiArwqDCoMKgwqAgKiBiZWZvcmUgU1ZNDQo+Pj4+Pj4g
K8KgwqDCoMKgICovDQo+Pj4+Pj4gK8KgwqDCoCBwZGQtPnFwZC5jd3NyX2Jhc2UgPSBTVk1fQ1dT
Ul9CQVNFOw0KPj4+Pj4+ICvCoMKgwqAgcGRkLT5xcGQuaWJfYmFzZSA9IFNWTV9JQl9CQVNFOw0K
Pj4+Pj4+ICsNCj4+Pj4+PiDCoMKgwqDCoMKgIHBkZC0+c2NyYXRjaF9iYXNlID0gTUFLRV9TQ1JB
VENIX0FQUF9CQVNFX1ZJKCk7DQo+Pj4+Pj4gwqDCoMKgwqDCoCBwZGQtPnNjcmF0Y2hfbGltaXQg
PSBNQUtFX1NDUkFUQ0hfQVBQX0xJTUlUKHBkZC0+c2NyYXRjaF9iYXNlKTsNCj4+Pj4+PiDCoCB9
DQo+Pj4+Pj4gQEAgLTMzOSwxOCArMzQ2LDE5IEBAIHN0YXRpYyB2b2lkIGtmZF9pbml0X2FwZXJ0
dXJlc192OShzdHJ1Y3QNCj4+Pj4+PiBrZmRfcHJvY2Vzc19kZXZpY2UgKnBkZCwgdWludDhfdCBp
ZCkNCj4+Pj4+PiDCoMKgwqDCoMKgIHBkZC0+bGRzX2Jhc2UgPSBNQUtFX0xEU19BUFBfQkFTRV9W
OSgpOw0KPj4+Pj4+IMKgwqDCoMKgwqAgcGRkLT5sZHNfbGltaXQgPSBNQUtFX0xEU19BUFBfTElN
SVQocGRkLT5sZHNfYmFzZSk7DQo+Pj4+Pj4gwqAgLcKgwqDCoMKgwqDCoMKgIC8qIFJhdmVuIG5l
ZWRzIFNWTSB0byBzdXBwb3J0IGdyYXBoaWMgaGFuZGxlLCBldGMuDQo+Pj4+Pj4gTGVhdmUgdGhl
IHNtYWxsDQo+Pj4+Pj4gLcKgwqDCoMKgwqDCoMKgwqAgKiByZXNlcnZlZCBzcGFjZSBiZWZvcmUg
U1ZNIG9uIFJhdmVuIGFzIHdlbGwsIGV2ZW4NCj4+Pj4+PiB0aG91Z2ggd2UgZG9uJ3QNCj4+Pj4+
PiAtwqDCoMKgwqDCoMKgwqDCoCAqIGhhdmUgdG8uDQo+Pj4+Pj4gLcKgwqDCoMKgwqDCoMKgwqAg
KiBTZXQgZ3B1dm1fYmFzZSBhbmQgZ3B1dm1fbGltaXQgdG8gQ0FOT05JQ0FMIGFkZHJlc3Nlcw0K
Pj4+Pj4+IHNvIHRoYXQgdGhleQ0KPj4+Pj4+IC3CoMKgwqDCoMKgwqDCoMKgICogYXJlIHVzZWQg
aW4gVGh1bmsgdG8gcmVzZXJ2ZSBTVk0uDQo+Pj4+Pj4gLcKgwqDCoMKgwqDCoMKgwqAgKi8NCj4+
Pj4+PiAtwqDCoMKgwqDCoMKgwqAgcGRkLT5ncHV2bV9iYXNlID0gU1ZNX1VTRVJfQkFTRTsNCj4+
Pj4+PiArwqDCoMKgIHBkZC0+Z3B1dm1fYmFzZSA9IEFNREdQVV9WQV9SRVNFUlZFRF9CT1RUT007
DQo+Pj4+Pj4gwqDCoMKgwqDCoCBwZGQtPmdwdXZtX2xpbWl0ID0NCj4+Pj4+PiBwZGQtPmRldi0+
a2ZkLT5zaGFyZWRfcmVzb3VyY2VzLmdwdXZtX3NpemUgLSAxOw0KPj4+Pj4+IMKgIMKgwqDCoMKg
wqAgcGRkLT5zY3JhdGNoX2Jhc2UgPSBNQUtFX1NDUkFUQ0hfQVBQX0JBU0VfVjkoKTsNCj4+Pj4+
PiDCoMKgwqDCoMKgIHBkZC0+c2NyYXRjaF9saW1pdCA9IE1BS0VfU0NSQVRDSF9BUFBfTElNSVQo
cGRkLT5zY3JhdGNoX2Jhc2UpOw0KPj4+Pj4+ICsNCj4+Pj4+PiArwqDCoMKgIC8qDQo+Pj4+Pj4g
K8KgwqDCoMKgICogUGxhY2UgVEJBL1RNQSBvbiBvcHBvc2l0ZSBzaWRlIG9mIFZNIGhvbGUgdG8g
cHJldmVudA0KPj4+Pj4+ICvCoMKgwqDCoCAqIHN0cmF5IGZhdWx0cyBmcm9tIHRyaWdnZXJpbmcg
U1ZNIG9uIHRoZXNlIHBhZ2VzLg0KPj4+Pj4+ICvCoMKgwqDCoCAqLw0KPj4+Pj4+ICvCoMKgwqAg
cGRkLT5xcGQuY3dzcl9iYXNlID0gQU1ER1BVX1ZBX1JFU0VSVkVEX1RSQVBfU1RBUlQoDQo+Pj4+
Pj4gK8KgwqDCoMKgwqDCoMKgIHBkZC0+ZGV2LT5hZGV2LT52bV9tYW5hZ2VyLm1heF9wZm4gPDwN
Cj4+Pj4+PiBBTURHUFVfR1BVX1BBR0VfU0hJRlQpOw0KPj4+Pj4+IMKgIH0NCj4+Pj4+PiDCoCDC
oCBpbnQga2ZkX2luaXRfYXBlcnR1cmVzKHN0cnVjdCBrZmRfcHJvY2VzcyAqcHJvY2VzcykNCj4+
Pj4+PiBAQCAtNDA3LDEyICs0MTUsNiBAQCBpbnQga2ZkX2luaXRfYXBlcnR1cmVzKHN0cnVjdCBr
ZmRfcHJvY2Vzcw0KPj4+Pj4+ICpwcm9jZXNzKQ0KPj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gLUVJTlZBTDsNCj4+Pj4+PiDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIH0NCj4+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCB9DQo+Pj4+Pj4gLQ0KPj4+Pj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIC8qIGRHUFVzOiB0aGUgcmVzZXJ2ZWQgc3BhY2UgZm9yIGtlcm5lbA0K
Pj4+Pj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
KiBiZWZvcmUgU1ZNDQo+Pj4+Pj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCAqLw0KPj4+Pj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIHBkZC0+cXBkLmN3c3JfYmFzZSA9IFNWTV9DV1NSX0JBU0U7DQo+Pj4+
Pj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcGRkLT5x
cGQuaWJfYmFzZSA9IFNWTV9JQl9CQVNFOw0KPj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoCB9DQo+
Pj4+Pj4gwqAgwqDCoMKgwqDCoMKgwqDCoMKgIGRldl9kYmcoa2ZkX2RldmljZSwgIm5vZGUgaWQg
JXVcbiIsIGlkKTsNCj4+Pj4+DQo=
