Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7B52D0D6D
	for <lists+amd-gfx@lfdr.de>; Wed,  9 Oct 2019 13:13:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FD766E97A;
	Wed,  9 Oct 2019 11:13:09 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820052.outbound.protection.outlook.com [40.107.82.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EA636E97A
 for <amd-gfx@lists.freedesktop.org>; Wed,  9 Oct 2019 11:13:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yr19iMBol+5hrRRo1HmTHQNPW/iOejhYorQnh9pqMPphHcgeQhxIGWO8r5nh+ylsrSrqki/lq5KTYeQHtzpKF+NlQKcHYNFUX2/T33MF+GHn4EO010XcRX2Vla/szpD85A8HW4lAZWmWyRUFtt8AHs9YXAgXYRkEtt47exNnjn8OKUDoPc5D/ToRJ6VOZd7/v5UU6t7pYibasoDUhT6EwikHkxGJ2T+Dy/qroBJmgVKtmYTc/Q8ldbQQCfDX6Bess51iNRRFib2lAB5nR2Sc+B0wJeYuFsrOUOhg5zBlmPTGusyoZcjmUcmZmIKCKWwE18gcM5TsxrBRn4qxLlkV/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b1/oiDOJ8mZ0OjuvNEUBo2+I/R42hMEdfhrFwYzicak=;
 b=MqhytnUePvH8zpWyD5znKOUfE7NeTqi5ArFxyHjLs/3gNwbHDnhxp3oTgTRgPp6wpMoMCO0y2JPFM84X9UHUG+2bkmiukuTmxbgOPwusZW/2dzoQQOoXh8hV2aaqS94rfzUyBjWM8f+XnoW6FjVrt0y+T627izeBmRsF2zjPBs3sIvlYj7C8VN642ryVYVIqTz74vE1gZi2ConWP/mcFAIfPe7Ma8RvxKTEfactAdwLhpgWYG4I+lRujDwF9tOu7PrHE+V94flvhYpYyQSe3ixJrPqGTGOKm5PqtHlAbwbD55Tczle3l8HJbZw/v54LnEo5gfN/jdz4utiJD0S480g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from SN1PR12MB2544.namprd12.prod.outlook.com (52.132.197.144) by
 SN1PR12MB2576.namprd12.prod.outlook.com (52.132.197.161) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2327.24; Wed, 9 Oct 2019 11:13:07 +0000
Received: from SN1PR12MB2544.namprd12.prod.outlook.com
 ([fe80::d06a:add5:ae4b:5121]) by SN1PR12MB2544.namprd12.prod.outlook.com
 ([fe80::d06a:add5:ae4b:5121%7]) with mapi id 15.20.2327.025; Wed, 9 Oct 2019
 11:13:07 +0000
From: "Yin, Tianci (Rico)" <Tianci.Yin@amd.com>
To: "Tuikov, Luben" <Luben.Tuikov@amd.com>, Alex Deucher
 <alexdeucher@gmail.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Recall: [PATCH 7/8] drm/amdgpu: reserve vram for memory training
Thread-Topic: [PATCH 7/8] drm/amdgpu: reserve vram for memory training
Thread-Index: AQHVfpKH8wNlH4fRkUiLLxZlTp4o5A==
X-CallingTelephoneNumber: IPM.Note
X-VoiceMessageDuration: 1
X-FaxNumberOfPages: 0
Date: Wed, 9 Oct 2019 11:13:07 +0000
Message-ID: <SN1PR12MB2544C19778CB64E816F1296E95950@SN1PR12MB2544.namprd12.prod.outlook.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bbfd4dc7-bc51-4631-123b-08d74ca9a9ce
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: SN1PR12MB2576:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SN1PR12MB25764CE7C65168AD4B191D7F95950@SN1PR12MB2576.namprd12.prod.outlook.com>
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
x-microsoft-antispam-message-info: rARHCOkKVKnq3wxiep0epBlXacs/Q375pgtK43O0+DFxtO4l3xosR4HniEDrM6VZ92+Nx8kPgT5rD5/e+jIRPwtWMEzu7uyinpxrCjLZkNNCUSJaz/fvSjecFmxCDEJMuyM9t02V/omlcE41ykPLXodjzYQEai5SwhgftZrvnAy8qkokFb/iPI+JwnRWWEG1HyB3xkmBD78VxAdsxj4kKoi0l7SBK6wrKehmdafJgulSvCs1s+ijoYiRfDDbDWUUJWN9dqgFji4aQOPnrybxKVCiytR8zYxT3pQkcgkWVhKuPNe614W0h3DerVjQdr/ZxxcUdBiEZgoNJuiUu/F1sDDd3FRJS9aziCvjCoAUSMB6r1NTBfa9sldYevWqXWLsPUnN+BsD0T/FtbILqoDEFB1m0yZd1Gv5bgX5eTIzSAg=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bbfd4dc7-bc51-4631-123b-08d74ca9a9ce
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Oct 2019 11:13:07.7873 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wJVyuSwBHTPWAufGsdmmnebDcQhB4XzOenCN+nydpDgZIBHEP6CN1nyJwwFWlvYPZmmhEEOYO/BLuhOpm0Xomw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB2576
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b1/oiDOJ8mZ0OjuvNEUBo2+I/R42hMEdfhrFwYzicak=;
 b=IsQ/7xMFzbc/0v0lXh4PAgem1wkMP0UUGFCnCmLnaeox8gpsyyv2ZfvrpXvm4d5oRcgIm2YqJmEkjkva7P3HOJPxgywXRO0ImVbZG9o3XFh6uay9KmiB4eT49ZNzyte02LDGmf61YiFZYEFtuTEaD+VP5p+hTfRuTrX5sZnx/D4=
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
