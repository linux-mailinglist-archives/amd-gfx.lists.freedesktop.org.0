Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BEC86D0D6C
	for <lists+amd-gfx@lfdr.de>; Wed,  9 Oct 2019 13:13:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 496FC6E2EF;
	Wed,  9 Oct 2019 11:13:01 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820055.outbound.protection.outlook.com [40.107.82.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0394F6E2EF
 for <amd-gfx@lists.freedesktop.org>; Wed,  9 Oct 2019 11:12:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MTOVyAyqssNV7ycd2gcs0KucV3SH/LGm4VjrIUpK6AEPh6eguqz09Jpv0AIRIcni1L27IMLOBAsYJ1Zc+SuUdOcnrK9TbuG4IP+K1PvbCkSgAVx4q21kCcnX59d2bVahsQ61BM9us7ApzE+3tH/LFzLAe7oa3MGnlpbBJF4UfpKQ+s4Z6qHsFOjV7wwmExuykbgZPl2pdTM3/Dwet7K4zjhf1aRPLwQg4QnOYABErweDo7rn0/ywaIszcvOEQhdEVjFISBxDIljpgvuBrFcii9ihYACHpXHiBla2oJDdOR621Q3n5EZO42Bc6YAlKWgom4ZDXj4NkkmtStHK3H+jsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b1/oiDOJ8mZ0OjuvNEUBo2+I/R42hMEdfhrFwYzicak=;
 b=oQ2ZgY3N1zt/lRoe4CjzYarB+8seag7UIglhijxeWAAY4agXWcYdHS9Qm6iU+qV/NjXi3xxNVic56bjItPiyHeD+CXMaqUwT85rKHqxBZx4eTh23lPwfOk4ZYhdFBZdcgkRl1QA7aPj0f7HXQl8HK+bvWkhHuopyB093Wb53pQ0JqWmHamNGS3z2QUGJwTrkgy9D2oZbajz+OZDsZ3hiwBKzcv4+f0X/kwYR/aELsUsGIpth8dNLlv3GmsfJ8JG/5U9L7UWcZp9Xk07R49EeWeqlrESRocy6wrvChHwipjIc9AzBrIzA9np0orcZ0QnIX20VnwGO1/NM+43XZlpqRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from SN1PR12MB2544.namprd12.prod.outlook.com (52.132.197.144) by
 SN1PR12MB2576.namprd12.prod.outlook.com (52.132.197.161) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2327.24; Wed, 9 Oct 2019 11:12:58 +0000
Received: from SN1PR12MB2544.namprd12.prod.outlook.com
 ([fe80::d06a:add5:ae4b:5121]) by SN1PR12MB2544.namprd12.prod.outlook.com
 ([fe80::d06a:add5:ae4b:5121%7]) with mapi id 15.20.2327.025; Wed, 9 Oct 2019
 11:12:58 +0000
From: "Yin, Tianci (Rico)" <Tianci.Yin@amd.com>
To: "Tuikov, Luben" <Luben.Tuikov@amd.com>, Alex Deucher
 <alexdeucher@gmail.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Recall: [PATCH 7/8] drm/amdgpu: reserve vram for memory training
Thread-Topic: [PATCH 7/8] drm/amdgpu: reserve vram for memory training
Thread-Index: AQHVfpKBPhy+dH1ZHUmRKE9DjjKlTQ==
X-CallingTelephoneNumber: IPM.Note
X-VoiceMessageDuration: 1
X-FaxNumberOfPages: 0
Date: Wed, 9 Oct 2019 11:12:58 +0000
Message-ID: <SN1PR12MB25440AE5B799F325E0FBF93395950@SN1PR12MB2544.namprd12.prod.outlook.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 13bb3f60-b12c-4fbf-f21f-08d74ca9a464
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: SN1PR12MB2576:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SN1PR12MB2576E922AE86BD882218504B95950@SN1PR12MB2576.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-forefront-prvs: 018577E36E
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(39860400002)(136003)(376002)(396003)(346002)(189003)(199004)(66476007)(66446008)(76116006)(66556008)(64756008)(33656002)(6506007)(6116002)(66946007)(26005)(6436002)(2906002)(66066001)(102836004)(74316002)(110136005)(305945005)(3846002)(478600001)(558084003)(2501003)(4326008)(14454004)(486006)(86362001)(186003)(9686003)(7736002)(55016002)(476003)(25786009)(71190400001)(71200400001)(8676002)(81156014)(81166006)(99286004)(7696005)(5660300002)(8936002)(52536014)(256004)(316002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:SN1PR12MB2576;
 H:SN1PR12MB2544.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9mKFLt2Cr/y2ktW5CTRwGcffBk78TXrW7Th6yFYobV4IBGYwFTw3P0S6CxG8lQE4wmZmK87Tm/k2+DOGrZaKY0BOx58ZcURV2nIgE2ooVrkDpZN4agPuaYIwbBb9MY41ebjrxzJZt7+ITOjnZu5VdCXkEuC33WRbPCIrCYPXxvsIlK7yZe96hO30q7H6VysWn7bET+bqZVpbx9zYWlTYa5nIQfc6pCcbptcjGaurBM19WcMQJGRbAoCLa9jU88iCZd2VTiYjeZecJeKeeJNyGfixApVa9VJRxlnBi1Jqc32uab/J2JGgMifh62OxU8O3ALgDq1YDBC/j9oNH1w43Phzz9zQjGt3BUDNO29nf9vKEAZ2Temx63dn8m9h7UllenJB2eCjKAvZi4r2DQpjSUjRemCUOlzzGm782+0BIJIU=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13bb3f60-b12c-4fbf-f21f-08d74ca9a464
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Oct 2019 11:12:58.7077 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +8uxIbVQZFcwXvfFuwfwiGm0udTMEYw8ag8xHitEINY7/LLyTur7opaAjHn8USW/uFz1PmKB+CYNE/4J0KvLbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB2576
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b1/oiDOJ8mZ0OjuvNEUBo2+I/R42hMEdfhrFwYzicak=;
 b=WYIIsYh1QBZHxw+NJx+8TRa8F9VtF9z1B6p0Kttk0YwiQy2adhdXrjq0ArX/AkNj/LYnL/yM1kYcdZwBUfc7+UnTkt9ffvC1ZAPLna90gtVY+B0fEwM7yN4jvyzIv8iiVB6Bd4dj6JrukJuw3kohymnMcRle3QHu2XoiKpbM5PM=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Tianci.Yin@amd.com; 
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

WWluLCBUaWFuY2kgKFJpY28pIHdvdWxkIGxpa2UgdG8gcmVjYWxsIHRoZSBtZXNzYWdlLCAiW1BB
VENIIDcvOF0gZHJtL2FtZGdwdTogcmVzZXJ2ZSB2cmFtIGZvciBtZW1vcnkgdHJhaW5pbmciLgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1h
aWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
